defmodule InertiaWeb.Renderer do
  @moduledoc """
  """
  import Phoenix.Controller
  def render_inertia(conn, component, props) do
    render(conn, "index.html", %{page: Jason.encode!(%{
      "component" => component,
      "props" => props,
      "url" => conn.request_path,
      "version" => "1"
    })})
  end
end
