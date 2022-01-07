defmodule ShadowfallscampgroundWeb.Sections.SitesTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Sites

  test "creates a Sites element" do
    html =
      render_surface do
        ~F"""
        <Sites />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
