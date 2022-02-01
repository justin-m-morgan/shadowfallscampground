defmodule ShadowfallscampgroundWeb.Sections.MainHeroTest do
  use ShadowfallscampgroundWeb.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.MainHero

  test "creates a MainHero element" do
    html =
      render_surface do
        ~F"""
        <MainHero />
        """
      end

    assert html =~ "section__main-hero"
  end
end
