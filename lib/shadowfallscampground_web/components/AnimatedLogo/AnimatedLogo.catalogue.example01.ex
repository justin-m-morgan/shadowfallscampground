defmodule ShadowfallscampgroundWeb.Components.AnimatedLogo.Example01 do
  @moduledoc false

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.AnimatedLogo,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Components.AnimatedLogo

  def render(assigns) do
    ~F"""
    <AnimatedLogo />
    """
  end
end
