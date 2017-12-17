# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :helloworld,
  ecto_repos: [Helloworld.Repo]

# Configures the endpoint
config :helloworld, HelloworldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vvpJm9BUkOQZg9s+v1pWPC83eJgbCq3TkSrFpvM7fEoxiB9Vx+zEitRfZdDq65Db",
  render_errors: [view: HelloworldWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Helloworld.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
