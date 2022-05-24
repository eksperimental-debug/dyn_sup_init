defmodule DynSupInit.DynSup2 do
  use DynamicSupervisor

  def start_link(arg) do
    DynamicSupervisor.start_link(strategy: :one_for_one, name: Keyword.fetch!(arg, :name))
  end

  @impl DynamicSupervisor
  def init(_args) do
    exit(:bye_dynamic_supervisor)

    options = [strategy: :one_for_one]
    DynamicSupervisor.init(options)
  end
end
