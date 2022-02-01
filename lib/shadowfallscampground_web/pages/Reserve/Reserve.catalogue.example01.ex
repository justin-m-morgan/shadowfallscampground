defmodule ShadowfallscampgroundWeb.Pages.Reserve.Example01 do
  @moduledoc false

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Pages.Reserve,
    height: "480px",
    body: [style: "padding: 1.5rem; background-color: #EEEEEE;"],
    title: ""

  alias ShadowfallscampgroundWeb.Pages.Reserve

  def render(assigns) do
    ~F"""
    <Reserve />
    """
  end
end
