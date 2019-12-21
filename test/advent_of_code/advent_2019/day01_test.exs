defmodule Day01Test do
  use ExUnit.Case
  alias AdventOfCode.Advent2019.Day01

  describe "calculates total fuel for some mass + fuel" do
    test "returns fuel value" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/fuel_requirements.txt")

      assert {:ok, 5104215} = Day01.for_modules(%{filename: path_to_file})
    end
  end
end
