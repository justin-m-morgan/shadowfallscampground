defmodule Shadowfallscampground.MixProject do
  use Mix.Project

  def project do
    [
      app: :shadowfallscampground,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers() ++ [:surface],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      test_paths: ["lib", "test"],
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Shadowfallscampground.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"] ++ catalogues()
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.6"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.7"},
      {:ecto_sqlite3, ">= 0.0.0"},
      {:phoenix_html, "~> 3.2"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:phoenix_live_view, "~> 0.17"},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:esbuild, "~> 0.4", runtime: Mix.env() == :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.19"},
      {:jason, "~> 1.3"},
      {:plug_cowboy, "~> 2.5"},
      # Data
      {:money, "~> 1.9"},
      {:timex, "~> 3.7"},
      # UI
      {:surface, "~> 0.7"},
      {:surface_formatter, "~> 0.7"},
      {:surface_catalogue, "~> 0.3"},
      {:tailwind, "~> 0.1", runtime: Mix.env() == :dev},
      {:petal_components, "~> 0.9.0"},
      # Email
      {:swoosh, "~> 1.6"},
      # Testing
      {:mix_test_interactive, "~> 1.1", only: :dev, runtime: false},
      {:floki, ">= 0.32.0", only: :test},
      {:ex_machina, "~> 2.7", only: [:test, :dev]},
      {:faker, "~> 0.17", only: [:test, :dev]},
      {:stream_data, "~> 0.5", only: :test},
      {:credo, "~> 1.6", only: :dev}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.deploy": [
        "tailwind default --minify",
        "esbuild default --minify",
        "phx.digest"
      ]
    ]
  end

  def catalogues do
    [
      "priv/catalogue"
    ]
  end
end
