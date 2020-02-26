defmodule MyAppWeb.PageControllerTest do
  use MyAppWeb.ConnCase
  import InertiaPhoenix 

  @session Plug.Session.init(
    store: :cookie,
    key: "_inertia_phoenix",
    encryption_salt: "yadayada",
    signing_salt: "yadayada"
  )

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
    assert response["props"] == %{"user" => %{"username" => "dblack"}}
  end

  test "flash", %{conn: conn} do
    conn = conn
    |> put_req_header("x-inertia", "true")
    |> put_req_header("x-inertia-version", assets_version())
    |> Plug.Session.call(@session)
    |> fetch_session()
    |> fetch_flash()
    |> put_flash(:info, "Test flash")
    |> get("/about")

    assert get_resp_header(conn, "x-inertia") == ["true"]
    
    response = json_response(conn, 200)
    assert response["version"] == assets_version()
    assert response["component"] == "About"
    assert response["props"] == %{"flash" => %{"info" => "Test flash"}}
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

  # test "maintains flash messages following 409", %{conn: conn} do
  #   conn = conn
  #   |> put_req_header("x-inertia", "true")
  #   |> put_req_header("x-inertia-version", "invalid")
  #   |> Plug.Session.call(@session)
  #   |> fetch_session()
  #   |> fetch_flash()
  #   |> put_flash(:info, "Test flash")
  #   |> get("/about")

  #   response = assert html_response(conn, 409)
  #   assert get_resp_header(conn, "x-inertia") == ["true"]
  #   assert get_resp_header(conn, "x-inertia-location") == ["http://www.example.com/about"]
  #   assert response["props"] == %{"flash" => %{"info" => "Test flash"}}
  # end


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
