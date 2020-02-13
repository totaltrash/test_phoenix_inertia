defmodule InertiaWeb.PageController do
  use InertiaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
