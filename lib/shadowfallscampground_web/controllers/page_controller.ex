defmodule ShadowfallscampgroundWeb.PageController do
  use ShadowfallscampgroundWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
