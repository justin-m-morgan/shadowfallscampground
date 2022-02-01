defmodule ShadowfallscampgroundWeb.Sections.MainHero.Example01 do
  @moduledoc false

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Sections.MainHero,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Sections.MainHero

  def render(assigns) do
    ~F"""
    <MainHero />
    """
  end
end
