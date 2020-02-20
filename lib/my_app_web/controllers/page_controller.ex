defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller

  def home(conn, _params) do
    InertiaPhoenix.share(conn, "user", %{username: "dblack"})
    |> render_inertia("Home")
  end

  def about(conn, _params) do
    render_inertia(conn, "About")
  end

  def form_submit(conn, _params) do
    put_flash(conn, :info, "Test flash")
    |> redirect(to: "/about")
  end

  def items(conn, _params) do
    render_inertia(conn, "Item/List", props: %{ "items" => ["Test 1", "Test 2"] })
  end
end
