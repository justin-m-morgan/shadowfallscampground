defmodule ShadowfallscampgroundWeb.Sections.Calendar.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Sections.Calendar,
    height: "480px",
    body: [style: "padding: 1.5rem; background-color: #EEEEEE;"],
    title: ""

  alias ShadowfallscampgroundWeb.Sections.Calendar

  def render(assigns) do
    ~F"""
    <Calendar />
    """
  end
end

