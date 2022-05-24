defmodule DynSupInit.Sup1 do
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: :"sup_#{Keyword.fetch!(arg, :name)}")
  end

  @impl Supervisor
  def init(arg) do
    exit(:bye_supervisor)

    children = [
      # {DynSupInit.Worker, [name: :"worker_#{Keyword.fetch!(arg, :name)}"]}
    ]

    options = [strategy: :one_for_one]
    Supervisor.init(children, options)
  end
end
