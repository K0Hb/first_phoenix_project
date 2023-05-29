defmodule FirstPhoenixProject.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :eng, :string
      add :rus, :string
    end
  end
end
