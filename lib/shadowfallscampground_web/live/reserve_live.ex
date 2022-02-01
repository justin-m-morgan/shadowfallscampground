defmodule ShadowfallscampgroundWeb.ReserveLive do
  @moduledoc """
  LiveView for reservation route
  """
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Pages

  def render(assigns) do
    ~F"""
    <Pages.Reserve />
    """
  end
end
