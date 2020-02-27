defmodule MyAppWeb.AuthErrorHandler do
  use MyAppWeb, :controller
  alias Plug.Conn

  @spec call(Conn.t(), atom()) :: Conn.t()
  def call(conn, :not_authenticated) do
    conn
    |> put_flash(:error, "Login required")
    |> redirect(to: Routes.login_path(conn, :new))
  end

  @spec call(Conn.t(), atom()) :: Conn.t()
  def call(conn, :already_authenticated) do
    conn
    |> put_flash(:error, "You're already authenticated")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
