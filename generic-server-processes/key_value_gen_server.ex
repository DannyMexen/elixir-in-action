defmodule KeyValueStore do
  use GenServer

  def start do
    GenServer.start(KeyValueStore, nil)
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  # init/1 accepts one argument. This is the second argument provided to GenServer.start/2
  # and you can use it to pass data to the server process while starting it
  def init(_) do
    # The result of init/1 must be in the format {:ok, initial_state}
    {:ok, %{}}
  end

  # handle_cast/2 accepts the request and the state and should return the result
  # in the format {:noreply, new_state}
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # handle_call/3 takes the request, the caller information, and the state.
  # It should return the result in the format {:reply, response, new_state}
  def handle_call({:get, key}, _, state) do
    {:reply, Map.get(state, key), state}
  end
end
