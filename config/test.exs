import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :disabled_bug, DisabledBug.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "disabled_bug_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :disabled_bug, DisabledBugWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ggvj3A6MYjOfm+C8vxI9lpmeLGKaYKAaoYcAozHbcKiVNGjsvubpdKDAFY1lTP4C",
  server: true

# In test we don't send emails.
config :disabled_bug, DisabledBug.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :wallaby,
  driver: Wallaby.Chrome,
  otp_app: :disabled_bug,
  chromedriver: [
    headless: false
  ]
