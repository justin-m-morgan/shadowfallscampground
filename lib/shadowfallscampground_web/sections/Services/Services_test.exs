defmodule ShadowfallscampgroundWeb.Sections.ServicesTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Services

  test "creates a Services element" do
    html =
      render_surface do
        ~F"""
        <Services />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
