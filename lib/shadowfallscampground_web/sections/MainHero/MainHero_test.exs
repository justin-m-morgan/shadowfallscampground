defmodule ShadowfallscampgroundWeb.Sections.MainHeroTest do
  use Shadowfallscampground.ConnCase, async: true

  alias ShadowfallscampgroundWeb.Sections.MainHero

  test "creates a MainHero element" do
    html =
      render_surface do
        ~F"""
        <MainHero />
        """
      end

    assert html =~ """
           #  Has Some Quality
           """
  end
end
