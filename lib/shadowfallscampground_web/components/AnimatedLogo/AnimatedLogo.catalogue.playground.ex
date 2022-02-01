defmodule ShadowfallscampgroundWeb.Components.AnimatedLogo.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Components.AnimatedLogo,
    height: "250px",
    body: [style: "padding: 1.5rem;"]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <AnimatedLogo {...@props} />
    """
  end
end
