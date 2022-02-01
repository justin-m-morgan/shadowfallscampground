defmodule ShadowfallscampgroundWeb.Sections.CalendarTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.Calendar

  test "creates a Calendar element" do
    html =
      render_surface do
        ~F"""
        <Calendar />
        """
      end

    assert html =~ ~s/section__event-calendar/
  end
end
