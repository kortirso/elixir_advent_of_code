defmodule AdventOfCode.Advent2019.Day04 do
  @moduledoc """
  Documentation for AdventOfCode.Advent2019
  """

  @doc """
  Perform a quiz, day 4, part 1

  ## Examples

      iex> AdventOfCode.Advent2019.Day04.perform(value, to)

  """
  def perform(value, to) do
    {:ok, do_perform(value, to, 0)}
  end

  defp do_perform(value, to, acc) when value > to, do: acc

  defp do_perform(value, to, acc) when value <= to do
    list_of_numbers =
      value
      |> Integer.to_string()
      |> String.graphemes()
      |> Enum.map(fn x -> x |> String.to_integer() end)
    if valid?(list_of_numbers, 0, false, false), do: do_perform(value + 1, to, acc + 1), else: do_perform(value + 1, to, acc)
  end

  defp valid?(_, _, _, true), do: false

  defp valid?(_, 5, true, false), do: true

  defp valid?(_, 5, _, _), do: false

  defp valid?(list_of_numbers, index, double, decrease) do
    a = Enum.at(list_of_numbers, index)
    b = Enum.at(list_of_numbers, index + 1)

    cond do
      a > b -> valid?(list_of_numbers, index, double, true)
      a == b -> valid?(list_of_numbers, index + 1, true, decrease)
      true -> valid?(list_of_numbers, index + 1, double, decrease)
    end
  end
end
