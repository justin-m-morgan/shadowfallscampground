defmodule ShadowfallscampgroundWeb.PageLive do
  @moduledoc """
  LiveView for static pages
  """
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Pages

  def render(assigns) do
    ~F"""
    <Pages.Index />
    """
  end
end
