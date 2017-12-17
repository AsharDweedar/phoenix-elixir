defmodule HelloworldWeb.CustomController do
  use HelloworldWeb, :controller

  def custom(conn, _params) do
    render conn, "custom.html"
  end
end
