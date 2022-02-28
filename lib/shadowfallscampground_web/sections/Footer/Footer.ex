defmodule ShadowfallscampgroundWeb.Sections.Footer do
  @moduledoc """
  Static content (Footer) for use in multiple locations in site.
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Endpoint
  alias ShadowfallscampgroundWeb.Components.CallToAction

  def render(assigns) do
    ~F"""
    <footer class="bg-accent-800 py-16 text-gray-50 text-lg" data-test="section__footer">
      <div class="container mx-auto grid md:grid-cols-2 items-center">
        <div class="">
          <h2 class="font-bold text-3xl lg:text-5xl pb-2">Shadow Falls</h2>
          <h3 class="text-xl">LGBTQ Campground</h3>
          <h3 class="text-xl">Harrison Mills, BC</h3>
          <ul class="pt-4">
            {#for %{icon: icon, label: label, link_target: link_target} <- footer_links()}
              <li class="inline-block">
                <a href={link_target} target="_blank" class="space-x-4 flex items-center">
                  <Svg.IconSymbol name={icon} size={:sm} />
                  <span>{label}</span>
                </a>
              </li>
            {/for}
          </ul>
        </div>
        <div class="space-x-4 lg:space-x-8 flex justify-end items-center">
          <CallToAction
            type="redirect"
            to={Routes.reserve_path(Endpoint, :new)}
            size={:xl}
            variant={:outline_light}
            opts={data_test: "make_booking_button"}
          >
            Book Now!
          </CallToAction>
          <CallToAction
            type="patch"
            to={Routes.page_path(Endpoint, :inquiry)}
            size={:xl}
            variant={:outline_light}
            opts={data_test: "send_inquiry_button"}
          >
            Contact Us
          </CallToAction>
        </div>
      </div>
    </footer>
    """
  end

  defp footer_links() do
    [
      %{
        icon: "facebook",
        label: "Facebook (Community Group)",
        link_target: "https://www.facebook.com/groups/2406513779"
      }
    ]
  end
end
