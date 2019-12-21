defmodule Day03Test do
  use ExUnit.Case
  alias AdventOfCode.Advent2019.Day03

  describe "calculates closest inetrsection" do
    test "returns value" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/day03_input.txt")

      assert {:ok, 529} = Day03.perform(%{filename: path_to_file})
    end
  end
end
