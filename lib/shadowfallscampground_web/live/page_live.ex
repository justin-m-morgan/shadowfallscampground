defmodule ShadowfallscampgroundWeb.PageLive do
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Pages

  def render(assigns) do
    ~F"""
    <Pages.Index />
    """
  end
end
