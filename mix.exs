defmodule ElixirAdventOfCode.MixProject do
  use Mix.Project

  @description """
  Application for Advent of Code 2019 with elixir
  """

  def project do
    [
      app: :elixir_advent_of_code,
      version: "0.1.0",
      elixir: "~> 1.9",
      name: "Grids",
      description: @description,
      source_url: "https://github.com/kortirso/elixir_advent_of_code",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Anton Bogdanov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kortirso/elixir_advent_of_code"}
    ]
  end
end
