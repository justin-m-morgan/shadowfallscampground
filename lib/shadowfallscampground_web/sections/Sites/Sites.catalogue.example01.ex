defmodule ShadowfallscampgroundWeb.Sections.Sites.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Sections.Sites,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Svg.IconSet
  alias ShadowfallscampgroundWeb.Sections.Sites

  def render(assigns) do
    ~F"""
    <IconSet />
    <Sites />
    """
  end
end
