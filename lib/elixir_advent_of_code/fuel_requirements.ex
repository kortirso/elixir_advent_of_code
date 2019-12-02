defmodule ElixirAdventOfCode.FuelRequirements do
  @moduledoc """
  Documentation for ElixirAdventOfCode.FuelRequirements
  """

  @doc """
  Perform a quiz, day 1, part 1

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
    |> Stream.map(&(calculate_fuel(&1)))
    |> Enum.sum()
  end

  defp calculate_fuel(value) do
    value |> string_to_integer() |> div(3) |> subtraction(2)
  end

  defp string_to_integer(value) do
    case Integer.parse(value) do
      {modified_value, _} -> modified_value
      _ -> 0
    end
  end

  defp subtraction(a, b), do: a - b
end
