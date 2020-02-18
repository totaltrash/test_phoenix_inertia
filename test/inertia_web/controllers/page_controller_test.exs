defmodule MyAppWeb.PageControllerTest do
  use MyAppWeb.ConnCase
  import InertiaPhoenix 
  # import Plug.Conn

  test "GET /", %{conn: conn} do
    response = conn
    |> get("/")
    |> html_response(200)

    assert response =~ "&quot;component&quot;:&quot;Home&quot;"
  end

  test "GET / XHR inertia request", %{conn: conn} do
    conn = conn
    |> put_req_header("x-inertia", "true")
    |> put_req_header("x-inertia-version", assets_version())
    |> get("/")

    assert get_resp_header(conn, "x-inertia") == ["true"]
    
    response = json_response(conn, 200)
    assert response["version"] == assets_version()
    assert response["component"] == "Home"
  end

  test "sends a 409 if an invalid asset version", %{conn: conn} do
    conn = conn
    |> put_req_header("x-inertia", "true")
    |> put_req_header("x-inertia-version", "invalid")
    |> get("/about")

    assert html_response(conn, 409)
    assert get_resp_header(conn, "x-inertia") == ["true"]
    assert get_resp_header(conn, "x-inertia-location") == ["http://www.example.com/about"]
  end


  # test "GET /about", %{conn: conn} do
  #   conn = get(conn, "/about")
  #   # assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  #   assert intertia_response(conn, 200, "About")
  # end

  # test "GET /", %{conn: conn} do
  #   conn = get(conn, "/")
  #   # assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  #   assert intertia_response(conn, 200, "Item/List")
  # end
end
