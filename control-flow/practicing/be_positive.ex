defmodule Be do

  def positive([]), do: []

  def positive([head | tail]) when head < 0 do
   positive(tail)
  end

  def positive([head | tail]) when head > 0 do
    [head | positive(tail)]
  end

end
