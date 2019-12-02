defmodule FuelRequirementsTest do
  use ExUnit.Case
  alias ElixirAdventOfCode.FuelRequirements

  describe "read from file" do
    test "returns error for unexisted file" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/fuel_requirements.txt")

      assert {:ok, 3404722} = FuelRequirements.for_modules(%{filename: path_to_file})
    end
  end
end
