defmodule ShadowfallscampgroundWeb.Components.ImageTest do
  @moduledoc false
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Components.Image

  test "creates a Image element" do
    html =
      render_surface do
        ~F"""
        <Image  src="https://fakeimg.pl/250x100/" alt="fake image"/>
        """
      end

    assert html =~ "<img"
  end
end
