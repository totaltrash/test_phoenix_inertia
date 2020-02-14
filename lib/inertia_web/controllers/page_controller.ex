defmodule InertiaWeb.PageController do
  use InertiaWeb, :controller

  def index(conn, _params) do
    # render_inertia(conn, "index.html", %{page: Jason.encode!(%{"component" => "Item/List", "props" => %{ "items" => ["Test 1", "Test 2"]}, "url" => "/", "version" => "1"})})
    render_inertia(conn, "Item/List", %{ "items" => ["Test 1", "Test 2"] })
  end
end
