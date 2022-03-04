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
        <Sections.MainHero />
        <Components.Section section_label="Location Description" section_label_hidden>
          <Sections.Location />
        </Components.Section>
        <Components.ImageBanner banner_number={1} />
        <Components.Section section_label="Site Descriptions">
          <Sections.Sites />
        </Components.Section>
        <Components.ImageBanner banner_number={2} />

        <Components.Section section_label="Event Calendar">
          <Sections.Calendar />
        </Components.Section>
        <Components.ImageBanner banner_number={3} />
        <Components.Section section_label="Available Services">
          <Sections.Services />
        </Components.Section>

        <Components.ImageBanner banner_number={4} />
      </main>
    </div>
    <Sections.Footer />
    """
  end
end
