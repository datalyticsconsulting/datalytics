defmodule DatalyticsWeb.Router do
  use DatalyticsWeb, :router
  use Pow.Phoenix.Router

  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation, PowInvitation, PowPersistentSession]

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

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :admin_role do
    plug DatalyticsWeb.EnsureRolePlug, :admin
  end

  pipeline :supervisor_role do
    plug DatalyticsWeb.EnsureRolePlug, :supervisor
  end

  scope "/" do
    pipe_through :browser

    pow_session_routes()
    # Swap pow_routes() with pow_session_routes if general log is in required
    # pow_routes()
    pow_extension_routes()
  end

  scope "/", Pow.Phoenix, as: "pow" do
    pipe_through [:browser, :protected]

    resources "/registration", RegistrationController,
      singleton: true,
      only: [:edit, :update, :delete]
  end

  scope "/", PowInvitation.Phoenix, as: "pow_invitation" do
    pipe_through [:browser, :protected, :admin_role]

    resources "/invitations", InvitationController, only: [:new, :create, :show]
  end

  scope "/", DatalyticsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", DatalyticsWeb do
    pipe_through [:browser, :protected]

    get "/dash", DashController, :dash
    get "/portal", PortalController, :portal
    resources "/form", FormController, except: [:delete]
    resources "/form/:messenger", FormController, except: [:delete]
    # Add your protected routes here
  end

  # scope "/admin", DatalyticsWeb do
  # pipe_through [:browser, :admin]

  #  end

  # scope "/supervisor", DatalyticsWeb do
  # pipe_through [:browser, :supervisor]

  # end

  # Other scopes may use custom stacks.
  # scope "/api", DatalyticsWeb do
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
      live_dashboard "/LiveDashboard", metrics: DatalyticsWeb.Telemetry
    end
  end
end
