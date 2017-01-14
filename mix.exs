defmodule Quotes.Mixfile do
  use Mix.Project

  def project do
    [app: :quotes,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test,
                         "coveralls.post": :test, "coveralls.html": :test]
                      ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Quotes, []},
     applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger,
                    :gettext, :phoenix_ecto, :postgrex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:travis), do: ["lib", "web", "test/support"]
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:phoenix_swagger, "~> 0.3.0"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:ex_machina, "~> 1.0", only: [:test, :travis]},
     {:credo, "~> 0.5.3", only: [:dev, :travis]},
     {:dogma, "~> 0.1.13", only: [:dev, :travis]},
     {:excoveralls, "~> 0.5", only: [:test, :travis]}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test --cover"]]
  end

  # This is the configuration for the swagger documentation
  def swagger_info do
    [version: "0.0.1", title: "Buddhist Quotes API"]
  end
end
