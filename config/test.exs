import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :shadowfallscampground, Shadowfallscampground.Repo,
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :shadowfallscampground, ShadowfallscampgroundWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "YkqJB8QxDvUaSHkvZ+XCVONYEksFLFGy8k2nI7KlvuTxSi4aHqzSKwhUrAO0YqU4",
  server: false

# In test we don't send emails.
config :shadowfallscampground, Shadowfallscampground.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# # Config for testing mail struct params drawn from system
# config :shadowfallscampground, ShadowfallscampgroundEmail.Mailer,
#   username: "test@test.com",
#   password: "passwordpassword",
#   adapter: Swoosh.Adapters.Local
