defmodule HelloworldWeb.Router do
  use HelloworldWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloworldWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/custom", CustomController, :custom
    get "/custom/another", CustomController, :another
    get "/custom/:messenger", CustomController, :msg
  end
 

  # Other scopes may use custom stacks.
  # scope "/api", HelloworldWeb do
  #   pipe_through :api
  # end
end
