defmodule ShadowfallscampgroundWeb.Sections.Footer.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Sections.Footer,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Sections.Footer

  def render(assigns) do
    ~F"""
    <Footer />
    """
  end
end
