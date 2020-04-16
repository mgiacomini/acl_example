defmodule AclExampleTest do
  use ExUnit.Case
  doctest AclExample

  test "greets the world" do
    assert AclExample.hello() == :world
  end
end
