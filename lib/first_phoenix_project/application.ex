defmodule FirstPhoenixProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FirstPhoenixProjectWeb.Telemetry,
      # Start the Ecto repository
      FirstPhoenixProject.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FirstPhoenixProject.PubSub},
      # Start Finch
      {Finch, name: FirstPhoenixProject.Finch},
      # Start the Endpoint (http/https)
      FirstPhoenixProjectWeb.Endpoint
      # Start a worker by calling: FirstPhoenixProject.Worker.start_link(arg)
      # {FirstPhoenixProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FirstPhoenixProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FirstPhoenixProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
