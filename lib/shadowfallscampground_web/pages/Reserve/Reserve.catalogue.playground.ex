defmodule ShadowfallscampgroundWeb.Pages.Reserve.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Pages.Reserve,
    height: "600px",
    body: [style: "padding: 1.5rem; background-color: #EEEEEE;"]

  data props, :map, default: %{}

  def render(assigns) do
    ~F"""
    <Reserve {...@props} />
    """
  end
end
