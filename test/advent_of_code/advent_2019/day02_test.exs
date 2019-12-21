defmodule Day02Test do
  use ExUnit.Case
  alias AdventOfCode.Advent2019.Day02

  describe "calculates value in 0 position" do
    test "returns value" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/opcodes.txt")

      assert {:ok, 7610} = Day02.perform(%{filename: path_to_file})
    end
  end
end
