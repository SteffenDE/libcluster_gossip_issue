defmodule LibclusterGossipIssue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies, [])

    children = [
      {Cluster.Supervisor, [topologies, [name: LibclusterGossipIssue.ClusterSupervisor]]}
      # Starts a worker by calling: LibclusterGossipIssue.Worker.start_link(arg)
      # {LibclusterGossipIssue.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LibclusterGossipIssue.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
