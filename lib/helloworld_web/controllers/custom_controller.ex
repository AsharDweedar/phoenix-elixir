defmodule HelloworldWeb.CustomController do
  use HelloworldWeb, :controller

  def custom(conn, _params) do
    render conn, "custom.html", greet: "hi again"
  end
  def another(conn, _params) do
    render conn, "another.html"
  end
  def msg(conn, %{"name" => name}) do
    greet = "hi : #{name}"
    IO.puts greet
    render conn, "msg.html", greet: greet
  end
  def hi(conn, %{"name" => name}) do
    greet = "hi : #{name}"
    IO.puts greet
    render conn, "hi.html", greet: greet
  end
end
