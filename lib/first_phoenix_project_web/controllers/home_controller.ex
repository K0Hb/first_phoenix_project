defmodule FirstPhoenixProjectWeb.HomeController do
  use FirstPhoenixProjectWeb, :controller

  alias FirstPhoenixProject.{Repo, Word, Fox}

  def index(conn, _params) do
    words = Repo.all(Word)

    render conn, "index.html", words: words
  end

  def show(conn, %{"id" => id}) do
    word = Repo.get(Word, id)

    render conn, "show.html", word: word
  end

  def fox(conn, _param) do
    fox = Fox.get_image_fox()

    render conn, "fox.html", fox: fox
  end
end
