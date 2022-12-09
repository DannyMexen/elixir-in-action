defmodule ListLengthTC do
  def unit_count(list) do
    do_unit_count(0, list)
  end

  defp do_unit_count(current_unit_count, []) do
    current_unit_count
  end

  defp do_unit_count(current_unit_count, [ _ | tail]) do
    new_unit_count = 1 + current_unit_count
    do_unit_count(new_unit_count, tail)
  end
end
