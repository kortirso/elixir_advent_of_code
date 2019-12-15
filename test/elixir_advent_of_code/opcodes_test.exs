defmodule OpcodesTest do
  use ExUnit.Case
  alias ElixirAdventOfCode.Opcodes

  describe "calculates value in 0 position" do
    test "returns value" do
      path_to_file = File.cwd! |> Path.join("test/fixtures/opcodes.txt")

      assert {:ok, 7610} = Opcodes.perform(%{filename: path_to_file})
    end
  end
end
