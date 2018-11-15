defmodule SampleWeb.PageController do
  use SampleWeb, :controller
  plug :modify_params
  plug :halt_on_ruben

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp modify_params(conn, _params) do
    name = conn.params["name"] || " World"
    conn
    |> assign(:name, name)
  end

  defp halt_on_ruben(conn, _params) do
    if(conn.params["name"] == "ruben") do
      conn
      |> send_resp(404, "not found")
    else
      conn
    end
  end
end
