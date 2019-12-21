defmodule Day03Test do
  use ExUnit.Case
  alias AdventOfCode.Advent2019.Day03

  describe "calculates value in 0 position" do
    test "returns value" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/day03_input.txt")

      Day03.perform(%{filename: path_to_file})
    end
  end
end