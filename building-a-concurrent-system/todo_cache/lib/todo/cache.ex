defmodule Todo.Cache do
  use GenServer

  def init(_) do
    {:ok, %{}}
  end

  def handle_call({:server_process, todo_list_name}, _, todo_servers) do
    case Map.fetch(todo_servers, todo_list_name) do
      # Server exists in the map
      {:ok, todo_server} ->
        {:reply, todo_server, todo_servers}

      # Server doesn't exist
      :error ->
        # Starts the new server
        {:ok, new_server} = Todo.Server.start()

        {
          :reply,
          new_server,
          Map.put(todo_servers, todo_list_name, new_server)
        }
    end
  end
end
