defmodule MyAppWeb.AuthController do
  use MyAppWeb, :controller

#   alias MyApp.Accounts
#   alias MyApp.Accounts.User

  def login(conn, _params) do
    # changeset = Pow.Plug.change_user(conn)

    render_inertia(conn, "Auth/Login")
  end

  def submit(conn, user_params) do
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
        |> redirect(to: Routes.login_path(conn, :login))
    end
  end
#   def logout(conn, _params) do
#     conn
#     |> Pow.Plug.delete()
#     |> redirect(to: Routes.page_path(conn, :index))
#   end
end
