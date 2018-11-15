defmodule SampleWeb.PageController do
  use SampleWeb, :controller
  plug :check_virus when action in [:upload]

  def index(conn, _params) do
    render conn, "index.html"
  end

  def upload(conn, params) do
    #process file
    conn
    |> put_flash(:info,  "Created successfully")
    |> redirect(to: "/")
  end

  defp check_virus(conn, _params) do
    file = conn.params["index"]["file"]
    case Clamxir.safe?(%Clamxir{daemonize: true}, file.path) do
      true ->
        # Process the file and ...
        conn
        |> put_flash(:info,  "Created successfully")
        |> redirect(to: "/")
      false ->
        conn
        |> put_status(503)
        |> put_flash(:error, "virus!!")
        |> render("index.html")
        |> Plug.Conn.halt()
    end
  end
end
