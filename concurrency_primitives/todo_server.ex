defmodule TodoServer do
  def start do
    # Uses a to-do list as the initial state
    spawn(fn -> loop(TodoList.new()) end)
  end

  def add_entry(todo_server, new_entry) do
    send(todo_server, {:add_entry, new_entry})
  end

  def entries(todo_server, date) do
    send(todo_server, {:entries, self(), date})

    receive do
      {:todo_entries, entries} -> entries
    after
      5000 -> {:error, :timeout}
    end
  end

  def loop(todo_list) do
    new_todo_list =
      receive do
        message -> process_message(todo_list, message)
      end

    loop(new_todo_list)
  end
end

defp process_message(todo_list, {:add_entry, new_entry}) do
  TodoList.add_entry(todo_list, new_entry)
end

defp process_message(todo_list, {:entries, caller, date}) do
  send(caller, {:todo_entries, TodoList.entries(todo_list, date)})
  todo_list
end

# TODO: Exercise on updating and deleting entries

defmodule TodoList do
end
