defmodule ShadowfallscampgroundWeb.ReserveLive do
  @moduledoc """
  LiveView for static pages
  """
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Endpoint

  def render(assigns) do
    ~F"""
    <div class="bg-trees min-h-screen">
      <div class="bg-primary-900/30 flex flex-col justify-center items-center min-h-screen">
        <p class={
          "py-24 px-24 mb-12 max-w-2xl",
          "bg-primary-900/90",
          "text-white font-bold text-3xl text-center"
        }>Reservations for the 2022 season will begin on April 1, 2022
        </p>

        <Components.CallToAction type="redirect" to={Routes.page_path(Endpoint, :index)} size={:lg}>
          Back to Home Page
        </Components.CallToAction>
      </div>
    </div>
    """
  end
end
