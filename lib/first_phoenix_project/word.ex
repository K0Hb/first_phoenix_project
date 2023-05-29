defmodule FirstPhoenixProject.Word do
  use Ecto.Schema

  schema "words" do
    field :eng, :string
    field :rus, :string
  end
end
