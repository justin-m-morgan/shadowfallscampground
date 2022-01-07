defmodule ShadowfallscampgroundWeb.Sections.LocationTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Location

  test "creates a Location element" do
    html =
      render_surface do
        ~F"""
        <Location />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
