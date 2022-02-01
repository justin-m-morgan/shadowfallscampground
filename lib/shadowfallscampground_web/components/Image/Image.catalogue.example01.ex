defmodule ShadowfallscampgroundWeb.Components.Image.Example01 do
  @moduledoc false

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.Image,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Components.Image

  def render(assigns) do
    ~F"""
    <Image src="#" alt="Dummy Image" />
    """
  end
end
