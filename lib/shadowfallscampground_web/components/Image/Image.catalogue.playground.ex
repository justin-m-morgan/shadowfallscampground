defmodule ShadowfallscampgroundWeb.Components.Image.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Components.Image,
    height: "600px",
    body: [style: "padding: 1.5rem;"]

  data props, :map,
    default: %{
      src: "#",
      alt: "Dummy Image"
    }

  def render(assigns) do
    ~F"""
    <Image {...@props} />
    """
  end
end
