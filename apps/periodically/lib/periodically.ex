defmodule Periodically do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Periodically.Server, []),
    ]

    opts = [strategy: :one_for_one, name: Periodically.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
