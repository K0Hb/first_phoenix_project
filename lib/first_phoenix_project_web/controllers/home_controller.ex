defmodule FirstPhoenixProjectWeb.HomeController do
  use FirstPhoenixProjectWeb, :controller

  alias FirstPhoenixProject.{Repo, Word}

  def index(conn, _params) do
    words = Repo.all(Word)

    render conn, "index.html", words: words
  end

  def show(conn, %{"id" => id}) do
    word = Repo.get(Word, id)

    render conn, "show.html", word: word
  end

  def new(conn, _params) do
    render conn, "new.html", changeset: Word.changeset(%Word{})
  end

  def create(conn, %{"create" => word}) do
    changeset = Word.changeset(%Word{}, word)

    case Repo.insert(changeset) do
      {:ok, world} ->
        conn |>
        put_flash(:info, "Слово добавлено") |>
        redirect(to: "/")
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    Repo.get(Word, id) |> Repo.delete

    conn
    |> put_flash(:info, "Слово удалено")
    |> redirect(to: "/")
  end

  def edit(conn, %{"id" => id}) do
    word =  Repo.get(Word, id)
    changeset = Word.changeset(word)

    render conn, "edit.html", word: word, changeset: changeset
  end

  def update(conn, %{"id" => id, "update" => word}) do
    old_word = Repo.get(Word, id)
    changeset = Word.changeset(old_word, word)

    case Repo.update(changeset) do
      {:ok, world} ->
        conn |>
        put_flash(:info, "Слово редактировано") |>
        redirect(to: "/")
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset
    end
  end
end
