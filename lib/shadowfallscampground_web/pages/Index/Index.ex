defmodule ShadowfallscampgroundWeb.Pages.Index do
  @moduledoc """

  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Sections

  def render(assigns) do
    ~F"""
    <div class="bg-trees">
    <main class={"bg-primary-900/70 px-12"}>
      <Components.Section>
        <Sections.MainHero />
      </Components.Section>
      <Components.Section>
        <Sections.Location />
      </Components.Section>
      <Components.Section>
        <Sections.Sites />
      </Components.Section>
      <Components.Section>
        <Sections.Services />
      </Components.Section>
      <Components.Section>
        <Sections.Calendar />
      </Components.Section>
    </main>
    </div>
    <Sections.Footer />
    """
  end
end
