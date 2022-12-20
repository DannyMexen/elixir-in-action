defmodule TodoCacheTest do
  # Prepares the module for testing
  use ExUnit.Case

  # Defines a test
  test "server_process" do
    {:ok, cache} = Todo.Cache.start()
    bob_pid = Todo.Cache.server_process(cache, "bob")
  end

  # Test assertions
  assert bob_pid != Todo.Cache.server_process(cache, "alice")
  assert bob_pid == Todo.Cache.server_process(cache, "bob")
end
