defmodule PlugEx do
  use Application
  require Logger

  def start(_type, _args) do
    port = Application.get_env(:plug_ex, :cowboy_port, 8000)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, PlugEx.Router, [], port: port)
    ]

    Logger.info "App Started!"

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
