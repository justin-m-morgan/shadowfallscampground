defmodule ShadowfallscampgroundWeb.Components.CallToAction.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.CallToAction,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Components.CallToAction

  def render(assigns) do
    ~F"""
    <CallToAction to="#" type="button">
      Hello
    </CallToAction>
    """
  end
end
