defmodule ShadowfallscampgroundWeb.Components.CallToActionTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.CallToAction

  test "creates a CallToAction element" do
    html =
      render_surface do
        ~F"""
        <CallToAction />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
