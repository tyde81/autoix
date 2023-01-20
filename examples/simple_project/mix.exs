defmodule SimpleProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_project,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:autoix, git: "https://github.com/tyde81/autoix"}
    ]
  end
end
