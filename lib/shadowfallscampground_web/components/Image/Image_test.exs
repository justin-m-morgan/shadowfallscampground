defmodule ShadowfallscampgroundWeb.Components.ImageTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.Image

  test "creates a Image element" do
    html =
      render_surface do
        ~F"""
        <Image />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
