defmodule ShadowfallscampgroundWeb.Sections.Sites.Playground do

  alias ShadowfallscampgroundWeb.Svg.IconSet

  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Sections.Sites,
    height: "600px",
    body: [style: "padding: 1.5rem; background-color: #EEEEEE"]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <IconSet />
    <Sites {...@props} />
    """
  end
end
