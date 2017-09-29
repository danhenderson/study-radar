defmodule Study.Router do
  use Study.Web, :router

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

  pipeline :with_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug Study.CurrentUser
  end

  pipeline :login_required do
    plug Guardian.Plug.EnsureAuthenticated, handler: Study.GuardianErrorHandler
  end

  scope "/admin", Study do
    pipe_through [:browser, :with_session]

    get "/login", Admin.SessionController, :new
    post "/login", Admin.SessionController, :create
    delete "/login", Admin.SessionController, :delete

    scope "/" do
      pipe_through [:login_required]
      get "/", Admin.DashboardController, :index
      resources "/categories", Admin.CategoryController
      resources "/disciplines", Admin.DisciplineController
      resources "/topics", Admin.TopicController
    end
  end

  scope "/", Study do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:discipline", PageController, :topics
    get "/:discipline/:topic", PageController, :topic
  end

  # Other scopes may use custom stacks.
  # scope "/api", Study do
  #   pipe_through :api
  # end
end
