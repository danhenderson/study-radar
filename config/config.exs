# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :study,
  ecto_repos: [Study.Repo]

# Configures the endpoint
config :study, Study.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0HoeL4sPqlED8O3txHFq2YaO8wb2ZXTjjoXSKungk+nEEPOY6H4Xr28xex87xmHs",
  render_errors: [view: Study.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Study.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Guardian authentication
config :guardian, Guardian,
 issuer: "Study.#{Mix.env}",
 ttl: {30, :days},
 verify_issuer: true,
 serializer: Study.GuardianSerializer,
 secret_key: to_string(Mix.env) <> "SuPerseCret_aBraCadabrA"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
