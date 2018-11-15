defmodule Sample.Clamxir do
  import Plug.Conn
  import Phoenix.Controller
  def init(options), do: options

  def call(conn, options) do
    file = conn.params["index"]["file"]
    case Clamxir.safe?(%Clamxir{daemonize: true}, file.path) do
      true ->
        conn
      false ->
        conn
        |> put_status(503)
        |> put_flash(:error, "virus!!")
        |> render("index.html")
        |> halt()
    end
  end
end
