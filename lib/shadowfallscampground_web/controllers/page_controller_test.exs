defmodule ShadowfallscampgroundWeb.PageControllerTest do
  use ShadowfallscampgroundWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Shadowfalls"
  end
end
