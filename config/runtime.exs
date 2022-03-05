import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

# DB Settings

db_url_access_error = """
environment variable DATABASE_URL is missing.
For example: postgres://ecaqhciaingrji:adsfjadfa@ec2-3-228-222-169.compute-1.amazonaws.com:5432/d4v1jg
"""

set_db_url = fn
  _, nil -> raise(db_url_access_error)
  :prod, url -> url
  :test, url -> url <> "_test"
  :dev, url -> url <> "_dev"
end

database_url =
  config_env()
  |> set_db_url.(System.get_env("DATABASE_URL"))

config :shadowfallscampground, Shadowfallscampground.Repo, url: database_url

# The secret key base is used to sign/encrypt cookies and other secrets.
# A default value is used in config/dev.exs and config/test.exs but you
# want to use a different value for prod and you most likely don't want
# to check this value into version control, so we use an environment
# variable instead.
secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :shadowfallscampground, ShadowfallscampgroundWeb.Endpoint,
  http: [
    # Enable IPv6 and bind on all interfaces.
    # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
    # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
    # for details about using IPv6 vs IPv4 and loopback vs public addresses.
    ip: {0, 0, 0, 0, 0, 0, 0, 0},
    port: String.to_integer(System.get_env("PORT") || "4000")
  ],
  secret_key_base: secret_key_base

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :shadowfallscampground, ShadowfallscampgroundWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.

# ## Configuring the mailer
#
# In production you need to configure the mailer to use a different adapter.
# Also, you may need to configure the Swoosh API client of your choice if you
# are not using SMTP. Here is an example of the configuration:
#

smtp_env_var = fn key ->
  System.get_env(key) ||
    raise """
    environment variable #{key} is missing.
    Remeber to set this in your runtime's environment variables/secrets
    """
end

config :shadowfallscampground, ShadowfallscampgroundEmail.Mailer,
  relay: smtp_env_var("SMTP_RELAY"),
  username: smtp_env_var("SMTP_USERNAME"),
  password: smtp_env_var("SMTP_PASSWORD")

# For this example you need include a HTTP client required by Swoosh API client.
# Swoosh supports Hackney and Finch out of the box:
#
#     config :swoosh, :api_client, Swoosh.ApiClient.Hackney
#
# See https://hexdocs.pm/swoosh/Swoosh.html#module-installation for details.

google_maps_api_key =
  System.get_env("GOOGLE_MAPS_API_KEY") ||
    raise """
    environment variable GOOGLE_MAPS_API_KEY is missing.
    Remeber to set this in your runtime's environment variables/secrets
    """

config :shadowfallscampground,
  google_maps_api_key: google_maps_api_key
