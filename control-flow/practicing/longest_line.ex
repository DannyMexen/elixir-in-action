defmodule LongestLine do
  def count(path) do
    # 1. Open file
    # 2. Count line lengths
    # 3. Return largest count
    File.stream!(path)
    |> Stream.map(&String.length/1)
    |> Enum.max()
  end

  def content(path) do
    # Count of longest line
    # Return longest

    count =
      File.stream!(path)
      |> Stream.map(&String.length/1)
      |> Enum.max()

    File.stream!(path)
    |> Stream.filter(&(String.length(&1) === count))
    |> Enum.to_list()
  end
end
