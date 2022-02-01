defmodule ShadowfallscampgroundWeb.Components.ImageBannerTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.ImageBanner

  test "creates a ImageBanner element" do
    html =
      render_surface do
        ~F"""
        <ImageBanner />
        """
      end

    assert html =~ ~s/data-test="image-banner"/
  end
end
