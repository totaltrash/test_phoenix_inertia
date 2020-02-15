defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :inertia do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Inertia.Plugs.AssetsCheck
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, false
    plug :put_view, MyAppWeb.InertiaView
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyAppWeb do
    pipe_through :inertia

    get "/", PageController, :home
    get "/about", PageController, :about
    get "/items/list", PageController, :items
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyAppWeb do
  #   pipe_through :api
  # end
end
