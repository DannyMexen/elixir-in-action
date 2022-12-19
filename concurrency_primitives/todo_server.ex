defmodule TodoServer do
  def start do
    # Uses a to-do list as the initial state
    spawn(fn -> loop(TodoList.new()) end)
  end

  def loop(todo_list) do
    new_todo_list =
      receive do
        message -> process_message(todo_list, message)
      end

    loop(new_todo_list)
  end
end

defmodule TodoList do
end
