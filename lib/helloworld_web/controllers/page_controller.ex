defmodule HelloworldWeb.PageController do
  use HelloworldWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def postme(conn, params) do
    IO.puts "params"
    IO.puts params
    render conn, "<h1> posted </h1>"
  end
end
