defmodule MoxTest.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mox_test,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: compiler_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def compiler_paths(:test), do: ["lib", "test/support"]
  def compiler_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mox, "~> 0.3.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end