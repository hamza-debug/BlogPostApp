defmodule BlogPostWeb.Router do
  use BlogPostWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BlogPostWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug BlogPost.Authentication.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogPostWeb do
    pipe_through :browser

    live "/", PageLive, :index

    live "/posts", PostLive.Index, :index
    live "/posts/new", PostLive.Index, :new




    live "/users/register", UserLive.Index  , :index
    live "/login", UserLive.Login, :login

    post "/", LoginController, :login
    get "/logout", LoginController, :logout

  end


  scope "/", BlogPostWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    live "/protected/:id/posts", PostLive.Posts, :index
    live "/protected/:id/posts/new", PostLive.Posts, :new

    live "/protected/:id/posts/edit", PostLive.Posts, :edit
    live "/posts/:id", PostLive.Show, :show
    live "/posts/:id/show/edit", PostLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogPostWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: BlogPostWeb.Telemetry
    end
  end
end
