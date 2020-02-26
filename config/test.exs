use Mix.Config

# Configure your database
config :my_app, MyApp.Repo,
  username: "dblack",
  password: "dbpass",
  database: "test_elixir_inertia_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_app, MyAppWeb.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :my_app, :sql_sandbox, true

config :wallaby,
  driver: Wallaby.Experimental.Chrome,
  chrome: [headless: true],
  js_logger: nil
