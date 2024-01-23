defmodule DisabledBug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DisabledBugWeb.Telemetry,
      DisabledBug.Repo,
      {DNSCluster, query: Application.get_env(:disabled_bug, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DisabledBug.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: DisabledBug.Finch},
      # Start a worker by calling: DisabledBug.Worker.start_link(arg)
      # {DisabledBug.Worker, arg},
      # Start to serve requests, typically the last entry
      DisabledBugWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DisabledBug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DisabledBugWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
