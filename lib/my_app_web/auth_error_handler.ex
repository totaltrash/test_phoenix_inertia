defmodule MyAppWeb.AuthErrorHandler do
  use MyAppWeb, :controller
  alias Plug.Conn

  def call(conn, :not_authenticated) do
    conn
    |> put_flash(:error, "Login required")
    |> redirect(to: Routes.auth_path(conn, :login_form))
  end

  def call(conn, :already_authenticated) do
    conn
    |> put_flash(:error, "You're already authenticated")
    |> redirect(to: Routes.page_path(conn, :home))
  end
end
