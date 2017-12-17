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
    pipe_through :browser # Use the default browser stack, these are for middlewares 
    """
    # this one will have to pass auth midware
    # all authenticate_user pipelines will be called on this request before being forwarded 
    scope "/" do
      pipe_through [:authenticate_user, :ensure_admin]
      forward "/jobs", BackgroundJob.Plug # can pass args here :(, name : "ashar")
    end
    """
    post "/", PageController, :postme
    get "/", PageController, :index
  end
  scope "/custom", HelloworldWeb do
    pipe_through :browser

    get "/custom", CustomController, :custom
    get "/custom/another", CustomController, :another
    get "/custom/:name", CustomController, :msg
    # get "/", RootController, :index #will never get excuted => in order the line above will take the rout and the search for other matches will stop
    resources "/users", UserController, only: [:index, :edit] #select some of the standard routes that comes with it 
    resources "/posts", UserController, except: [:delete] #select all the standard routes that comes with it except of delete
  end
 

  # Other scopes may use custom stacks.
  # scope "/api", HelloworldWeb do
  #   pipe_through :api
  # end
end
