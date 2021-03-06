defmodule Conway.Mixfile do
  use Mix.Project

  def project do
    [app: :conway,
     version: "0.0.2",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger,:cowboy, :plug] ,
     mod: {Conway,[]}]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 0.8.1"}]
  end
end
