defmodule ShadowfallscampgroundWeb.Components.CallToActionTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.CallToAction

  test "creates a CallToAction element" do
    html =
      render_surface do
        ~F"""
        <CallToAction opts={data_test: "call-to-action"}>
          Test Button
        </CallToAction>
        """
      end

    assert html =~ ~s/data-test="call-to-action"/
    assert html =~ ~s/Test Button/
  end
end
