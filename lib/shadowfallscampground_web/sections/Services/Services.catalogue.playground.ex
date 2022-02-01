defmodule ShadowfallscampgroundWeb.Sections.Services.Playground do
  @moduledoc false
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Sections.Services,
    height: "600px",
    body: [style: "padding: 1.5rem;"]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <Services {...@props} />
    """
  end
end
