defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :inertia do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug InertiaPhoenix.Plug
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyAppWeb do
    pipe_through :inertia

    get "/", PageController, :home
    get "/about", PageController, :about
    get "/items", PageController, :items
    post "/form_submit", PageController, :form_submit
    resources "/users", UserController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyAppWeb do
  #   pipe_through :api
  # end
end
