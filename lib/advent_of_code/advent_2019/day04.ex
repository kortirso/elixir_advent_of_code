defmodule AdventOfCode.Advent2019.Day04 do
  @moduledoc """
  Documentation for AdventOfCode.Advent2019
  """

  @doc """
  Perform a quiz, day 4, part 2

  ## Examples

      iex> AdventOfCode.Advent2019.Day04.perform(value, to)

  """
  def perform(value, to) do
    {:ok, do_perform(value, to, 0)}
  end

  defp do_perform(value, to, acc) when value > to, do: acc

  defp do_perform(value, to, acc) when value <= to do
    result = value |> Integer.digits() |> valid?(0, {[]}, false)
    if result, do: do_perform(value + 1, to, acc + 1), else: do_perform(value + 1, to, acc)
  end

  defp valid?(_, _, _, true), do: false

  defp valid?(_, 5, {double, _}, false) do
    cond do
      Enum.count(double) == 1 && Enum.at(double, 0) > 2 -> false
      Enum.count(double) == 2 && Enum.at(double, 0) == 3 && Enum.at(double, 1) == 3 -> false
      true -> true
    end
  end

  defp valid?(_, 5, _, _), do: false

  defp valid?(list_of_numbers, index, double, decrease) do
    a = Enum.at(list_of_numbers, index)
    b = Enum.at(list_of_numbers, index + 1)

    cond do
      a > b -> valid?(list_of_numbers, index, double, true)
      a == b -> valid?(list_of_numbers, index + 1, check_doubles(double, b), decrease)
      true -> valid?(list_of_numbers, index + 1, double, decrease)
    end
  end

  defp check_doubles(double, value) do
    cond do
      elem(double, 0) == [] -> {[2], value}
      elem(double, 1) == value ->
        [head | tail] = elem(double, 0)
        {[head + 1 | tail], value}
      true -> {[2 | elem(double, 0)], value}
    end
  end
end
