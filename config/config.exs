# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :quotes,
  ecto_repos: [Quotes.Repo]

# Configures the endpoint
config :quotes, Quotes.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XzOfG/qNfeMCNSt+O4G/4FpHy98b+x9gtn4Jz5t0B+MDrFjQa77qlh8ZZQN1U2yX",
  render_errors: [view: Quotes.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Quotes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
