defmodule ShadowfallscampgroundWeb.Sections.ServicesTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Services

  test "creates a Services element" do
    html =
      render_surface do
        ~F"""
        <Services />
        """
      end

    assert html =~ "section__services"
  end
end
