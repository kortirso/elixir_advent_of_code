defmodule ElixirAdventOfCode.FuelRequirements do
  @moduledoc """
  Documentation for ElixirAdventOfCode.FuelRequirements
  """

  @doc """
  Perform a quiz, day 1, part 2

  ## Examples

      iex> ElixirAdventOfCode.FuelRequirements.for_modules(%{filename: filename})
      {:ok, 3404722}

  """
  def for_modules(%{filename: filename}) do
    case File.read(filename) do
      {:ok, content} -> {:ok, do_perform(content)}
      _ -> {:error, "File does not exists"}
    end
  end

  defp do_perform(content) do
    content
    |> String.split("\n", trim: true)
    |> Stream.map(fn (value) -> value |> string_to_integer() |> calculate_total_fuel(0) end)
    |> Enum.sum()
  end

  # total fuel for some mass + fuel
  defp calculate_total_fuel(value, acc) when value <= 0, do: acc - value

  defp calculate_total_fuel(value, acc) do
    need_fuel = calculate_fuel(value)
    calculate_total_fuel(need_fuel, acc + need_fuel)
  end

  # fuel for some mass
  defp calculate_fuel(value) do
    value |> div(3) |> subtraction(2)
  end

  defp string_to_integer(value) do
    case Integer.parse(value) do
      {modified_value, _} -> modified_value
      _ -> 0
    end
  end

  defp subtraction(a, b), do: a - b
end
