defmodule ElixirAdventOfCode.Opcodes do
  @moduledoc """
  Documentation for ElixirAdventOfCode.Opcodes
  """

  @doc """
  Perform a quiz, day 2, part 2

  ## Examples

      iex> ElixirAdventOfCode.FuelRequirements.Opcodes(%{filename: filename})

  """
  def perform(%{filename: filename}) do
    case File.read(filename) do
      {:ok, content} -> {:ok, do_perform(content)}
      _ -> {:error, "File does not exists"}
    end
  end

  defp do_perform(content) do
    content
    |> String.split(",")
    |> Stream.map(fn (value) -> value |> string_to_integer() end)
    |> Enum.with_index(0)
    |> Enum.reduce(%{}, fn {value, key}, acc -> Map.put(acc, key, value) end)
    |> check_intcode(0, 0)
  end

  defp check_intcode(intcode, noun, 100), do: check_intcode(intcode, noun + 1, 0)

  defp check_intcode(intcode, noun, verb) do
    result =
      intcode
      |> Map.put(1, noun)
      |> Map.put(2, verb)
      |> perform_instruction(0)
    if result == 19690720, do: (100 * noun + verb), else: check_intcode(intcode, noun, verb + 1)
  end

  defp perform_instruction(intcode, start_position) do
    case intcode[start_position] do
      1 ->
        intcode
        |> Map.put(intcode[start_position + 3], intcode[intcode[start_position + 1]] + intcode[intcode[start_position + 2]])
        |> perform_instruction(start_position + 4)
      2 ->
        intcode
        |> Map.put(intcode[start_position + 3], intcode[intcode[start_position + 1]] * intcode[intcode[start_position + 2]])
        |> perform_instruction(start_position + 4)
      99 -> intcode[0]
    end
  end

  defp string_to_integer(value) do
    case Integer.parse(value) do
      {modified_value, _} -> modified_value
      _ -> 0
    end
  end
end
