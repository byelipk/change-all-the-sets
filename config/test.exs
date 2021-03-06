use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_ecto, HelloEcto.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :hello_ecto, HelloEcto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "rails",
  password: "rails4dev",
  database: "hello_ecto_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
