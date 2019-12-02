defmodule FuelRequirementsTest do
  use ExUnit.Case
  alias ElixirAdventOfCode.FuelRequirements

  describe "calculates total fuel for some mass + fuel" do
    test "returns fuel value" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/fuel_requirements.txt")

      assert {:ok, 5104215} = FuelRequirements.for_modules(%{filename: path_to_file})
    end
  end
end
