defmodule MyAppWeb.FeatureCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias MyApp.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import MyAppWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MyApp.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(MyApp.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(MyApp.Repo, self())

    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
