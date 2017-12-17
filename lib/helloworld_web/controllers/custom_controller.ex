defmodule HelloworldWeb.CustomController do
  use HelloworldWeb, :controller

  def custom(conn, _params) do
    render conn, "custom.html"
  end
  def another(conn, _params) do
    render conn, "another.html"
  end
  def msg(conn, _params) do
    render conn, "msg.html"
  end
end
