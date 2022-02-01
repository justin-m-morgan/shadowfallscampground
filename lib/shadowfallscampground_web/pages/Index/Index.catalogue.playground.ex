defmodule ShadowfallscampgroundWeb.Pages.Index.Playground do
  @moduledoc false
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Pages.Index,
    height: "600px",
    body: [style: ""]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <Index {...@props} />
    """
  end
end
