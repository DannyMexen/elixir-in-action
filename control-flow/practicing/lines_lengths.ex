defmodule LinesLengths do
  def lines_lengths(path) do
    # 1. Open file stream at given path
    # 2. Count length of each line
    # 3. Return list of lengths

    # 1. Open file stream at given path
    File.stream!(path)

    # 2. Count length of each line
    |> Stream.map(&String.length/1)

    # 3. Return list of lengths
    |> Enum.to_list()
  end
end
