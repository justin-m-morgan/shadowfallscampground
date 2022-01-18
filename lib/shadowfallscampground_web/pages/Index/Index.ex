defmodule ShadowfallscampgroundWeb.Pages.Index do
  @moduledoc """

  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Sections


  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <div class="bg-trees">
    <main class={"bg-primary-900/70"}>
      <Components.Section>
        <Sections.MainHero />
      </Components.Section>
      <Components.Section>
        <Sections.Location />
      </Components.Section>
      <Components.ImageBanner banner_number={1} />
      <Components.Section>
        <Sections.Sites />
      </Components.Section>
      <Components.ImageBanner banner_number={2} />
      <Components.Section>
        <Sections.Services />
      </Components.Section>
      <Components.ImageBanner banner_number={1} />
      <Components.Section>
        <Sections.Calendar />
      </Components.Section>
    </main>
    </div>
    <Sections.Footer />
    """
  end
end
