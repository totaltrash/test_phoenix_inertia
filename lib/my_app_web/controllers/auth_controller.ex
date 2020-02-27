defmodule MyAppWeb.AuthController do
  use MyAppWeb, :controller

#   alias MyApp.Accounts
#   alias MyApp.Accounts.User

  def login_form(conn, _params) do
    # changeset = Pow.Plug.change_user(conn)

    render_inertia(conn, "Auth/Login")
  end

  def login_submit(conn, user_params) do
    conn
    |> Pow.Plug.authenticate_user(user_params)
    |> case do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :home))

      {:error, conn} ->
        conn
        |> put_flash(:danger, "Invalid email or password")
        |> redirect(to: Routes.auth_path(conn, :login_form))
    end
  end
  def logout(conn, _params) do
    conn
    |> Pow.Plug.delete()
    |> put_flash(:info, "Bye for now!")
    |> redirect(to: Routes.auth_path(conn, :login_form))
  end
end
