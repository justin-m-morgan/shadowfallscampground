defmodule ShadowfallscampgroundWeb.Pages.IndexTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Pages.Index

  test "creates a Index element" do
    html =
      render_surface do
        ~F"""
        <Index />
        """
      end

    assert html =~ """
          #  Has Some Quality
           """
  end
end

