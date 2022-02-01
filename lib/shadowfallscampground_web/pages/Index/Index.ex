defmodule ShadowfallscampgroundWeb.Pages.Index do
  @moduledoc """
  Layout page for index page sections
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Sections

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <div class="bg-trees">
      <main class="bg-primary-900/70" data-test="page__index">
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
        <Components.ImageBanner banner_number={3} />
        <Components.Section>
          <Sections.Calendar />
        </Components.Section>
        <Components.ImageBanner banner_number={4} />
      </main>
    </div>
    <Sections.Footer />
    """
  end
end
