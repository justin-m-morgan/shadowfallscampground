defmodule ShadowfallscampgroundWeb.Sections.Calendar.Playground do
  @moduledoc false
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Sections.Calendar,
    height: "600px",
    body: []

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <div class="bg-primary-900 p-4">
      <Calendar {...@props} />
    </div>
    """
  end
end
