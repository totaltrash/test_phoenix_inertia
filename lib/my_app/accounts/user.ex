defmodule MyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  # @derive {Jason.Encoder, only: [:username, :display_name, :email]}

  schema "users" do
    field :display_name, :string
    field :email, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :display_name, :email])
    |> validate_required([:username, :display_name, :email])
  end
end
