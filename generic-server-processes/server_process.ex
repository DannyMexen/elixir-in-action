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
      {:request, caller} ->
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
    send(server_pid, {request, self()}) # Sends the message

    receive do
      {:response, response} -> # Waits for the response
        response # Returns the response
    end
  end
end

# Implementation of a simple key/value store
# Usage - process that can be used to store mappings between arbitrary terms
defmodule KeyValueStore do
 def init do
   %{} # Initial process state
 end

 def handle_call({:put, key, value}, state) do # Handles the put request
   {:ok, Map.put(state, key, value)}
 end

 def handle_call({:get, key, value}) do # Handles the get request
   {Map.get(state, key), state}
 end
end
