defmodule ShadowfallscampgroundWeb.Sections.Location.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Sections.Location,
    height: "1000px",
    body: [style: "padding: 1.5rem;"]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <Location {...@props} />
    """
  end
end
