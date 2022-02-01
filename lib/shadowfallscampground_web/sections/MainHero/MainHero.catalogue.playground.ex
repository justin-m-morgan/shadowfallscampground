defmodule ShadowfallscampgroundWeb.Sections.MainHero.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Sections.MainHero,
    height: "800px",
    body: [style: "padding: 1.5rem; background-color: #DDDDDD"]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <MainHero {...@props} />
    """
  end
end
