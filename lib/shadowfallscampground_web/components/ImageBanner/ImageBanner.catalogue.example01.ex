defmodule ShadowfallscampgroundWeb.Components.ImageBanner.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.ImageBanner,
    height: "480px",
    body: [style: "padding: 1.5rem; background-color: #DDDDDD;"],
    title: ""

  alias ShadowfallscampgroundWeb.Components.ImageBanner

  def render(assigns) do
    ~F"""
    <ImageBanner />
    """
  end
end

