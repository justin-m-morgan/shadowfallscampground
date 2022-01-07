defmodule ShadowfallscampgroundWeb.Sections.CalendarTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Calendar

  test "creates a Calendar element" do
    html =
      render_surface do
        ~F"""
        <Calendar />
        """
      end

    assert html =~ """
          #  Has Some Quality
           """
  end
end

