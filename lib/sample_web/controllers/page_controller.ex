defmodule SampleWeb.PageController do
  use SampleWeb, :controller
  def index(conn, _params) do
    render conn, "index.html"
  end

  def upload(conn, params) do
    file = params["index"]["file"]
    # Requires to have clamavdscann to work
    case Clamxir.safe?(%Clamxir{daemonize: true}, file.path) do
      true -> 
        # Process the file and ... 
        conn
        |> put_flash(:info,  "Created successfully")
        |> redirect(to: "/") 
      false -> conn
           |> put_flash(:error,  "Virus!!")
           |> redirect(to: "/") 
    end
  end
end
