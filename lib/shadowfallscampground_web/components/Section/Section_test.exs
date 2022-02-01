defmodule ShadowfallscampgroundWeb.Components.SectionTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.Section

  test "creates a Section element" do
    html =
      render_surface do
        ~F"""
        <Section>
          <p>Test Content</p>
        </Section>
        """
      end

    assert html =~ ~s/data-test="section-component"/
  end
end
