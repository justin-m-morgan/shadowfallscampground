defmodule ShadowfallscampgroundWeb.PageLive do
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Components.CallToAction

  def render(assigns) do
    ~F"""
    <div>
      <CallToAction to="#">Hello</CallToAction>
    </div>
    <p class={"text-white", "text-4xl": true}>This is a live view</p>
    """
  end
end
