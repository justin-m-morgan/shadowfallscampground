defmodule ShadowfallscampgroundWeb.Sections.SitesTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Sites

  test "creates a Sites element" do
    html =
      render_surface do
        ~F"""
        <Sites />
        """
      end

    assert html =~ ~s/data-test="section__sites"/
  end
end
