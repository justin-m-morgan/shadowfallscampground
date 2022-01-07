defmodule ShadowfallscampgroundWeb.Components.AnimatedLogoTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.AnimatedLogo

  test "creates a AnimatedLogo element" do
    html =
      render_surface do
        ~F"""
        <AnimatedLogo />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
