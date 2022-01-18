defmodule ShadowfallscampgroundWeb.Sections.Calendar do
  @moduledoc """

  """
  use ShadowfallscampgroundWeb, :component

  import Shadowfallscampground.Data.Events, only: [events_listing: 0]

  defstruct [:name, :theme, :date, :description]

  def render(assigns) do
    ~F"""
    <div class="grid md:grid-cols-3 gap-8">
      {#for %{name: name, theme: theme, date: date, description: description, icon: icon, icon_classes: icon_classes} <- events_listing()}
        <Components.Card label={name} padding={:lg} >
          <Svg.IconSymbol name={icon} class={icon_classes} size={:md}/>
          <div class="flex flex-col items-center space-y-2">
            <div class="">
              <p class="">{theme}</p>
              <p class="font-light text-lg lg:text-xl pt-4">{Timex.format!(date, "{WDshort}, {Mshort} {D}, {kitchen}")}</p>
            </div>
            <p class="text-center lg:text-xl">{description}</p>
          </div>
        </Components.Card>
      {/for}
    </div>
    """
  end
end
