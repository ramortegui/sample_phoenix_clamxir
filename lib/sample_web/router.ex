defmodule SampleWeb.Router do
  use SampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assing_process_id
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SampleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/upload", PageController, :upload
  end

  # Other scopes may use custom stacks.
  # scope "/api", SampleWeb do
  #   pipe_through :api
  # end

  defp assing_process_id(conn, _params) do
    Plug.Conn.assign(conn,:process_id, inspect self)
    |> IO.inspect
  end
end
