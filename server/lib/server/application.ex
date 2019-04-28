defmodule Server.Application do
  # Module-based Supervisor for Server.lixserver
  use Supervisor

  def start(_type, _args) do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      Server.LixServer
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
