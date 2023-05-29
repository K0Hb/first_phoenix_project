defmodule FirstPhoenixProject.Repo do
  use Ecto.Repo,
    otp_app: :first_phoenix_project,
    adapter: Ecto.Adapters.Postgres
end
