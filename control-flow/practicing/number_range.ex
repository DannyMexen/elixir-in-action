defmodule NumberRange do

  def range(from, to) when from === to, do: [to]

  def range(from, to) do

    [from | range(from + 1, to)]

  end

end
