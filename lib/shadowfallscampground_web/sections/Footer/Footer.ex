defmodule ShadowfallscampgroundWeb.Sections.Footer do
  @moduledoc """

  """
  use ShadowfallscampgroundWeb, :component

  def render(assigns) do
    ~F"""
    <footer class="bg-accent-800 py-16 text-gray-50 text-lg flex justify-center">
      <div class="grid md:grid-cols-2 gap-16 max-w-6xl">
        <div class="">
          <h2 class="font-bold text-3xl">Shadow Falls</h2>
          <h3>LGBTQ Campground</h3>
          <h3>Harrison Mills, BC</h3>
        </div>
        <div>
          <ul>
            {#for %{icon: icon, label: label, link_target: link_target} <- footer_links()}
              <a href={link_target}>
                <li class="space-x-4 flex items-center">
                  <Svg.IconSymbol name={icon} size={:sm} />
                  <span>{label}</span>
                </li>
              </a>
            {/for}
          </ul>
        </div>
      </div>
    </footer>
    """
  end

  defp footer_links() do
    [
      %{
        icon: "envelope",
        label: "Contact Us",
        link_target: "#"
      },
      %{
        icon: "facebook",
        label: "Facebook (Community Group)",
        link_target: "#"
      }
    ]
  end
end
