defmodule ShadowfallscampgroundWeb.Components.SectionTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.Section

  test "creates a Section element" do
    html =
      render_surface do
        ~F"""
        <Section />
        """
      end

    assert html =~ """
          #  Has Some Quality
           """
  end
end

