defmodule NumberRange do

  def range(from, to) do
    do_range([], from, to)
  end

  defp do_range([_|_], from, to) when from > to do
    []
  end

  defp do_range([ head | tail], from, to) do
    
  end
end
