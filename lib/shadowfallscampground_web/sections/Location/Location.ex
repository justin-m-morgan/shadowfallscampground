defmodule ShadowfallscampgroundWeb.Sections.Location do
  @moduledoc """
  Static section (Location) of the index page
  """
  use Surface.Component

  alias ShadowfallscampgroundWeb.Components.Image

  @google_maps_base_url "https://www.google.com/maps/embed/v1/"
  @google_maps_place_param "place?q=place_id:ChIJRZiDe9IQhFQRKXaWy_QOSyo"
  @google_maps_zoom_param "zoom=9"

  def render(assigns) do
    ~F"""
    <div data-test="section__location">
      <div class="flex flex-col md:grid grid-cols-1 md:grid-cols-6 items-center justify-center pb-8 space-y-8 md:space-y-0">
        <div class={
          "md:col-span-3 md:col-start-1 md:row-start-1 ",
          "bg-primary-50/70 rounded filter backdrop-blur-md",
          "px-2 py-4 md:p-8",
          "z-20"
        }>
          <div class="prose lg:text-3xl lg:px-4 lg:py-6">
            {#for para <- location_description()}
              <p>{para}</p>
            {/for}
          </div>
        </div>
        <div class="col-span-4 row-start-1 col-start-3 rounded-lg overflow-hidden">
          <Image src="shadowfalls_gxoye4.jpg" alt="Shadow Falls waterfall" class="object-cover" />
        </div>
      </div>
      <div class="relative overflow-hidden p-32 md:p-48 lg:p-64 rounded-lg">
        <iframe
          class="absolute inset-0 w-full h-full"
          style="border:0"
          loading="lazy"
          allowfullscreen
          src={google_maps_url()}
        >
        </iframe>
      </div>
    </div>
    """
  end

  defp location_description() do
    [
      "Shadow Falls Campground is located in the historic community of Harrison Mills, British Columbia. The campground is 110km east of Vancouver and 20 minutes drive from Harrison Hot Springs.",
      "The property is a forested 40-acres, with a creek runninng through it. There are many trails and waterfalls to explore, a clubhouse for events, proper indoor washrooms, and a 5000sqft green-space for socializing and sunbathing."
    ]
  end

  defp google_maps_url() do
    @google_maps_base_url
    |> Kernel.<>(@google_maps_place_param)
    |> Kernel.<>("&key=" <> Application.fetch_env!(:shadowfallscampground, :google_maps_api_key))
    |> Kernel.<>("&" <> @google_maps_zoom_param)
  end
end
