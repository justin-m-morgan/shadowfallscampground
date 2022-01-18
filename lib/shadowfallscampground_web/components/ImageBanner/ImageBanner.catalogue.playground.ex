defmodule ShadowfallscampgroundWeb.Components.ImageBanner.Playground do
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Components.ImageBanner,
    height: "600px",
    body: [style: "padding: 1.5rem; background-color: #DDDDDD;"]

  data props, :map, default: %{
    images: [1,2,3,4]
  }

  def render(assigns) do
    ~F"""
    <ImageBanner {...@props} />
    """
  end
end
