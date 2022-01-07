defmodule ShadowfallscampgroundWeb.Components.ImageBannerTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.ImageBanner

  test "creates a ImageBanner element" do
    html =
      render_surface do
        ~F"""
        <ImageBanner />
        """
      end

    assert html =~ """
          #  Has Some Quality
           """
  end
end

