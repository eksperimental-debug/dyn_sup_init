defmodule DynSupInit.Worker do
  use GenServer

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: Keyword.fetch!(arg, :name))
  end

  # Callbacks
  @impl GenServer
  def init(arg) do
    {:ok, arg}
  end

  @impl GenServer
  def handle_call(:state, from, state) do
    {:reply, {from, state}, state}
  end
end
