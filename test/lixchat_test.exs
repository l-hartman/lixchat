defmodule LixchatTest do
  use ExUnit.Case
  doctest Lixchat

  test "greets the world" do
    assert Lixchat.hello() == :world
  end
end
