defmodule ListLength do
  def unit_count([]), do: 0

  def unit_count([ _ | tail]) do
    1 + unit_count(tail)
  end
end
