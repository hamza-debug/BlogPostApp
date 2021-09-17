# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blog_post,
  ecto_repos: [BlogPost.Repo]

# Configures the endpoint
config :blog_post, BlogPostWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iGA7yw3TDnwVOdCta6HMtQjdIc+PINboYnRMC4n7ggn3YFkf9eGvdIngw+dn3gPb",
  render_errors: [view: BlogPostWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BlogPost.PubSub,
  live_view: [signing_salt: "4d48k+YI"]


config :blog_post, BlogPost.Authentication.Guardian,
issuer: "blog_post",
secret_key: "RGxWQqZwUcuDyMK7jCrvY2AWL2OXU25K3Y1yPbNFf4m5Tn/Km3jtk99bME4g35/f"


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
