defmodule ShadowfallscampgroundWeb.Components.CardTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.Card

  test "creates a Card element" do
    html =
      render_surface do
        ~F"""
        <Card />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
