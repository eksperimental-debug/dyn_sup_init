defmodule DynSupInit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Dynamic supervisor from module DynamicSupervisor
      {DynamicSupervisor, name: :dyn_sup_a, strategy: :one_for_one},

      # Dynamic supervisor from module child directly
      {DynSupInit.DynSup1, name: :dyn_sup_b, strategy: :one_for_one},

      # Dynamic supervisor with t:Supervsor.child_spec/0
      %{
        id: :dyn_sup_c,
        start: {DynSupInit.DynSup2, :start_link, [[name: :dyn_sup_c]]}
      },

      # Supervisor
      {DynSupInit.Sup1, name: :d}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DynSupInit.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
