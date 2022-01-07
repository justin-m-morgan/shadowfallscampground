defmodule ShadowfallscampgroundWeb.Sections.Services.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Sections.Services,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Sections.Services

  def render(assigns) do
    ~F"""
    <Services />
    """
  end
end
