defmodule ShadowfallscampgroundWeb.Sections.Location.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Sections.Location,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Sections.Location

  def render(assigns) do
    ~F"""
    <Location />
    """
  end
end
