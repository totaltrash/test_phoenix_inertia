ExUnit.start(exclude: [:skip])

# Ecto.Adapters.SQL.Sandbox.mode(MyApp.Repo, :manual)

Application.put_env(:wallaby, :base_url, MyAppWeb.Endpoint.url)

{:ok, _} = Application.ensure_all_started(:wallaby)
