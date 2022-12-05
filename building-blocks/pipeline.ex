defmodule SimplePipelineExample do
  def print_absolute_value do
    -5
    |> abs()
    |> Integer.to_string()
    |> IO.puts()
  end
end
