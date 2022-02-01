defmodule ShadowfallscampgroundWeb.Components.CallToAction.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Components.CallToAction,
    height: "250px",
    body: [style: "padding: 1.5rem;"]

  data props, :map,
    default: %{
      to: "#",
      content: "Button Text"
    }

  def render(assigns) do
    ~F"""
    <CallToAction {...@props}>
      {@props[:content]}
    </CallToAction>
    """
  end
end
