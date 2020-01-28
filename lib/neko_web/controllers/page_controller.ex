defmodule NekoWeb.PageController do
  use NekoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
