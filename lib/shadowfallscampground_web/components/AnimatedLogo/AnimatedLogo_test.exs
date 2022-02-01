defmodule ShadowfallscampgroundWeb.Components.AnimatedLogoTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.AnimatedLogo

  test "creates a AnimatedLogo element" do
    html =
      render_surface do
        ~F"""
        <AnimatedLogo />
        """
      end

    assert html =~ "<svg"
  end
end
