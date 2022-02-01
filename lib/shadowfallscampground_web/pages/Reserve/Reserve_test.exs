defmodule ShadowfallscampgroundWeb.Pages.ReserveTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Pages.Reserve

  test "creates a Reserve element" do
    html =
      render_surface do
        ~F"""
        <Reserve />
        """
      end

    assert html =~ ~s/data-test="page__reserve"/
  end
end
