defmodule ShadowfallscampgroundWeb.Pages.IndexTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Pages.Index

  test "creates a Index element" do
    html =
      render_surface do
        ~F"""
        <Index />
        """
      end

    assert html =~ ~s/data-test="page__index"/
  end
end
