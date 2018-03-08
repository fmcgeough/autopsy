defmodule AutopsyWeb.Router do
  use AutopsyWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", AutopsyWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)

    resources("/postmortems", PostMortemsController, only: [:index])
  end

  # Other scopes may use custom stacks.
  # scope "/api", AutopsyWeb do
  #   pipe_through :api
  # end
end