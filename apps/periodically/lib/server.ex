defmodule Periodically.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    Process.send_after(self(), :work, 10_000)
    {:ok, state}
  end

  def handle_info(:work, state) do
    2 * 2 * 2 * 2
    require Logger; Logger.info "foobar"
    Process.send_after(self(), :work, 10_000)
    {:noreply, state}
  end
end
