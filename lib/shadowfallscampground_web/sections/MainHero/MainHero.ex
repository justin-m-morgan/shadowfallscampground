defmodule ShadowfallscampgroundWeb.Sections.MainHero do
  @moduledoc """
  The Hero section of the Index page
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundEmail.EmailsView
  alias ShadowfallscampgroundWeb.Endpoint
  alias ShadowfallscampgroundWeb.Components.{AnimatedLogo, CallToAction}

  def render(assigns) do
    ~F"""
    <section
      class="flex flex-col justify-center items-center px-2 lg:py-18 xl:py-32 space-y-12 h-screen"
      data-test="section__main-hero"
    >
      <div class={
        "px-12 lg:px-48 py-8 lg:py-12",
        "text-center text-primary-900",
        "bg-primary-50 bg-circle"
      }>
        <AnimatedLogo class="h-48 lg:h-64" />
        <div class="px-8 md:px-24">
          <h1 class="text-2xl md:text-5xl font-bold">Shadow Falls</h1>
          <h3 class="text-lg md:text-2xl font-bold">LGBTQ Campground</h3>
          <p class="text-md md:text-lg">Harrison Mills, BC</p>
        </div>
      </div>
      <div class="w-full md:w-auto grid md:grid-cols-2 gap-4">
        <CallToAction
          type="redirect"
          to={Routes.reserve_path(Endpoint, :new)}
          size={:xl}
          opts={data_test: "make_booking_button"}
          class="w-full md:w-auto md:col-span-2"
        >
          Book Now!
        </CallToAction>

        <CallToAction
          type="patch"
          to={Routes.page_path(Endpoint, :inquiry)}
          size={:lg}
          variant={:outline_light}
          opts={data_test: "send_inquiry_button"}
          class="w-full md:w-auto"
        >
          Contact Form
        </CallToAction>

        <CallToAction
          type="link"
          to={EmailsView.email_url("General Inquiry")}
          size={:lg}
          variant={:outline_light}
          opts={data_test: "send_inquiry_button"}
          class="w-full md:w-auto"
        >
          Send Email
        </CallToAction>
      </div>
    </section>
    """
  end
end
