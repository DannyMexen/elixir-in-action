defmodule ServerProcess do
  def start(callback_module) do
    spawn(fn ->
      # Invokes the callback to initialize the state
      initial_state = callback_module.init()
      loop(callback_module, initial_state)
    end)
  end

  defp loop(callback_module, current_state) do
    receive do
      {request, caller} ->
        {response, new_state} =
          callback_module.handle_call(
            request,
            current_state
          )

        send(caller, {:response, response})

        loop(callback_module, new_state)
    end
  end

  def call(server_pid, request) do
    # Sends the message
    send(server_pid, {request, self()})

    receive do
      # Waits for the response
      {:response, response} ->
        # Returns the response
        response
    end
  end
end

# Implementation of a simple key/value store
# Usage - process that can be used to store mappings between arbitrary terms
defmodule KeyValueStore do
  def init do
    # Initial process state
    %{}
  end

  # Handles the put request
  def handle_call({:put, key, value}, state) do
    {:ok, Map.put(state, key, value)}
  end

  # Handles the get request
  def handle_call({:get, key, value}) do
    {Map.get(state, key), state}
  end
end
