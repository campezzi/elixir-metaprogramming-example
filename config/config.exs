# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blogex,
  ecto_repos: [Blogex.Repo]

# Configures the endpoint
config :blogex, Blogex.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dFU9Qn4QB73DIlrlHKlJCZ9Zp2CZOAcwCR1vttBQCUY39TqAp0Qaj7K4dwR0AW8r",
  render_errors: [view: Blogex.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Blogex.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
