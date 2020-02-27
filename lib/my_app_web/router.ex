defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug InertiaPhoenix.Plug
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: MyAppWeb.AuthErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated, error_handler: MyAppWeb.AuthErrorHandler
  end
  
  scope "/" do
    pipe_through :browser

    get "/login", MyAppWeb.AuthController, :login, as: :login
    post "/login", MyAppWeb.AuthController, :submit, as: :login_submit
  end

  scope "/", MyAppWeb do
    pipe_through [:browser, :protected]

    get "/", PageController, :home
    get "/about", PageController, :about
    get "/items", PageController, :items
    post "/form_submit", PageController, :form_submit
    resources "/users", UserController, except: [:new, :edit]

    delete "/logout", MyAppWeb.AuthController, :logout
  end
end
