defmodule ShadowfallscampgroundWeb.Sections.MainHero do
  @moduledoc """
  The Hero section of the Index page
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Components.{AnimatedLogo, CallToAction}

  def render(assigns) do
    ~F"""
    <section class="flex flex-col justify-center items-center">
      <div class="relative text-center text-primary-900 px-24 py-24 bg-primary-50 bg-circle">
        <AnimatedLogo class="h-64" />
        <h1 class="text-5xl font-bold">Shadow Falls</h1>
        <h2 class="text-2xl font-bold">LGBTQ Campground</h2>
        <h2 class="text-md">Harrison Mills, BC</h2>
      </div>
      <div class="space-y-4">
        <CallToAction to="#" size={:lg}>
          Book Now!
        </CallToAction>
        <CallToAction to="#" size={:lg}>
          Contact Us
        </CallToAction>
      </div>
    </section>
    """
  end
end
