# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :datalytics,
  ecto_repos: [Datalytics.Repo]

# Configures the endpoint
config :datalytics, DatalyticsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ckSjygNTMZNKXO8Bo1x3DEaqaYhmjeb2yiGHLnp2VZsInFJJ/nvVpZulv8lH1F2+",
  render_errors: [view: DatalyticsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Datalytics.PubSub,
  live_view: [signing_salt: "seaeyYYq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :datalytics, Datalytics.Pow.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :datalytics, :pow,
  user: Datalytics.Users.User,
  repo: Datalytics.Repo,
  web_module: DatalyticsWeb,
  extension: [PowResetPassword, PowPersistentSession, PowInvitation, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: DatalyticsWeb.Pow.Mailer,
  routes_backend: DatalyticsWeb.Pow.Routes

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
