# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :inertia,
  ecto_repos: [Inertia.Repo]

# Configures the endpoint
config :inertia, InertiaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XLOQCMN9oyt4H8p9FOjcjq7OWcD6uy/2IR9NwMNgeurzeP05BD0N8F0AtV03T6i0",
  render_errors: [view: InertiaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Inertia.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "c2yVtD4J"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
