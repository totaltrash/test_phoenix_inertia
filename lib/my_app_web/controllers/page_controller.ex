defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller

  def home(conn, _params) do
    inertia(conn, "Home")
  end

  def about(conn, _params) do
    inertia(conn, "About")
  end

  def items(conn, _params) do
    inertia(conn, "Item/List", %{ "items" => ["Test 1", "Test 2"] })
  end
end
