defmodule DynSupInitTest do
  use ExUnit.Case
  doctest DynSupInit

  test "greets the world" do
    assert DynSupInit.hello() == :world
  end
end
