defmodule Day04Test do
  use ExUnit.Case
  alias AdventOfCode.Advent2019.Day04

  describe "calculates amount of passwords" do
    test "returns value" do
      assert {:ok, 1063} = Day04.perform(246540, 787419)
    end
  end
end
