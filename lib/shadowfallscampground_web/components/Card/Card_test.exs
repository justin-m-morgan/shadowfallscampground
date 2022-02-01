defmodule ShadowfallscampgroundWeb.Components.CardTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.Card

  test "creates a Card element" do
    html =
      render_surface do
        ~F"""
        <Card>
          <p>Card Content</p>
        </Card>
        """
      end

    assert html =~ "Card Content"
  end
end
