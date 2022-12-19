defmodule ServerProcess do
  def start(callback_module) do
    spawn(fn ->
      initial_state = callback_module.init() # Invokes the callback to initialize the state
      loop(callback_module, initial_state)
    end)
  end
end
