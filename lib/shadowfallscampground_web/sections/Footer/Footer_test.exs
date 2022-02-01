defmodule ShadowfallscampgroundWeb.Sections.FooterTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Footer

  test "creates a Footer element" do
    html =
      render_surface do
        ~F"""
        <Footer />
        """
      end

    assert html =~ "section__footer"
  end
end
