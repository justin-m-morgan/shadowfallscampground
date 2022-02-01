defmodule ShadowfallscampgroundWeb.Components.Section.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Components.Section,
    height: "600px",
    body: [style: "padding: 1.5rem; background-color: #DDDDDD;"]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <Section {...@props}>
      <p>This is some test content</p>
    </Section>
    """
  end
end
