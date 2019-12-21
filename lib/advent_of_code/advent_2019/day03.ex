defmodule AdventOfCode.Advent2019.Day03 do
  @moduledoc """
  Documentation for AdventOfCode.Advent2019
  """

  @doc """
  Perform a quiz, day 3, part 1

  ## Examples

      iex> AdventOfCode.Advent2019.Day03.perform(%{filename: filename})

  """
  def perform(%{filename: filename}) do
    case File.read(filename) do
      {:ok, content} -> {:ok, do_perform(content)}
      _ -> {:error, "File does not exists"}
    end
  end

  defp do_perform(content) do
    [a, b] =
      content
      |> String.split("\n")
      |> Stream.map(fn value -> value |> String.split(",") end)
      |> Enum.map(fn value -> value_to_coordinates(value, {0, 0}, []) end)
    b
    |> Stream.map(fn value -> find_points(value, a) end)
    |> Enum.filter(fn value -> Enum.count(value) > 0 end)
    |> List.flatten()
    |> Enum.min()
  end

  defp value_to_coordinates([], _, acc), do: acc |> Enum.reverse()

  defp value_to_coordinates([head | tail], point, acc) do
    direction = head |> String.at(0)
    {distance, _} = head |> String.slice(1..-1) |> Integer.parse()
    end_point = calc_end_coordinates(point, direction, distance)
    value_to_coordinates(tail, end_point, [[point, end_point, direction] | acc])
  end

  defp calc_end_coordinates(point, direction, distance) do
    case direction do
      "R" -> {elem(point, 0) + distance, elem(point, 1)}
      "L" -> {elem(point, 0) - distance, elem(point, 1)}
      "U" -> {elem(point, 0), elem(point, 1) + distance}
      "D" -> {elem(point, 0), elem(point, 1) - distance}
    end
  end

  defp find_points([{start_x_b, start_y_b}, {end_x_b, _}, direction_b], a) when direction_b == "R" or direction_b == "L" do
    a
    |> Stream.filter(fn [_, _, direction_a] -> direction_a == "U" || direction_a == "D" end)
    |> Stream.filter(fn [{x, _}, _, _] ->
      if start_x_b < end_x_b do
        x >= start_x_b && x <= end_x_b
      else
        x >= end_x_b && x <= start_x_b
      end
    end)
    |> Stream.filter(fn [{_, start_y_a}, {_, end_y_a}, _] ->
      if start_y_a < end_y_a do
        start_y_b >= start_y_a && start_y_b <= end_y_a
      else
        start_y_b >= end_y_a && start_y_b <= start_y_a
      end
    end)
    |> Enum.map(fn [{x, _}, _, _] -> abs(x) + abs(start_y_b) end)
  end

  defp find_points([{start_x_b, start_y_b}, {_, end_y_b}, direction_b], a) when direction_b == "U" or direction_b == "D" do
    a
    |> Stream.filter(fn [_, _, direction_a] -> direction_a == "R" || direction_a == "L" end)
    |> Stream.filter(fn [{_, y}, _, _] ->
      if start_y_b < end_y_b do
        y >= start_y_b && y <= end_y_b
      else
        y >= end_y_b && y <= start_y_b
      end
    end)
    |> Stream.filter(fn [{start_x_a, _}, {end_x_a, _}, _] ->
      if start_x_a < end_x_a do
        start_y_b >= start_x_a && start_y_b <= end_x_a
      else
        start_y_b >= end_x_a && start_y_b <= start_x_a
      end
    end)
    |> Enum.map(fn [{_, y}, _, _] -> abs(start_x_b) + abs(y) end)
  end
end
