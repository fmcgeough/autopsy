defmodule AutopsyWeb.PageController do
  use AutopsyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
