defmodule ShadowfallscampgroundWeb.Sections.MainHero do
  @moduledoc """
  The Hero section of the Index page
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Endpoint
  alias ShadowfallscampgroundWeb.Components.{AnimatedLogo, CallToAction}

  def render(assigns) do
    ~F"""
    <section
      class="flex flex-col justify-center items-center lg:py-64 space-y-12"
      data-test="section__main-hero"
    >
      <div class={
        "px-12 lg:px-48 py-8 lg:py-12",
        "text-center text-primary-900",
        "bg-primary-50 bg-circle"
      }>
        <AnimatedLogo class="h-48 lg:h-64" />
        <div class="px-8 md:px-24">
          <h1 class="text-4xl md:text-5xl font-bold">Shadow Falls</h1>
          <h2 class="text-xl md:text-2xl font-bold">LGBTQ Campground</h2>
          <h2 class="text-md">Harrison Mills, BC</h2>
        </div>
      </div>
      <div class="w-full md:w-auto md:space-x-4 space-y-4 flex flex-col md:flex-row">
        <CallToAction
          type="redirect"
          to={Routes.reserve_path(Endpoint, :new)}
          size={:xl}
          opts={data_test: "make_booking_button"}
          class="w-full md:w-auto"
        >
          Book Now!
        </CallToAction>
        <CallToAction
          type="patch"
          to={Routes.page_path(Endpoint, :inquiry)}
          size={:xl}
          opts={data_test: "send_inquiry_button"}
          class="w-full md:w-auto"
        >
          Contact Us
        </CallToAction>
      </div>
    </section>
    """
  end
end
