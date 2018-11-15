defmodule SampleWeb.PageController do
  use SampleWeb, :controller
  plug Sample.Clamxir when action in [:upload]

  def index(conn, _params) do
    render conn, "index.html"
  end

  def upload(conn, params) do
    #process file
    conn
    |> put_flash(:info,  "Created successfully")
    |> redirect(to: "/")
  end
end
