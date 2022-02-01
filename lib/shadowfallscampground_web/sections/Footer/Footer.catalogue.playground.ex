defmodule ShadowfallscampgroundWeb.Sections.Footer.Playground do
  @moduledoc false
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Sections.Footer,
    height: "600px",
    body: [style: ""]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <Footer {...@props} />
    """
  end
end
