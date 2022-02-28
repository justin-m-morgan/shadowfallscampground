defmodule ShadowfallscampgroundWeb.Sections.Calendar do
  @moduledoc """
  Static content (event calendar)
  """
  use ShadowfallscampgroundWeb, :component

  import Shadowfallscampground.Data.Events, only: [events_listing: 0]

  defstruct [:name, :theme, :date, :description]

  def render(assigns) do
    ~F"""
    <div class="grid md:grid-cols-3 gap-8" data-test="section__event-calendar">
      <Components.Card label="Events 2022" padding={:lg} class="md:col-span-3">
        <p class="max-w-2xl mx-auto py-4 text-lg"><span class="font-bold">NOTE:</span> While cannot know what the COVID situation will be throughout the situation, we are anticipating that we can hold events this season. Please be aware that safety precautions (including checking of vaccination status) may be necessary in accordance with provincial regulations and our best judgement.</p>
      </Components.Card>
      {#for %{
          name: name,
          theme: theme,
          date: date,
          description: description,
          icon: icon,
          icon_classes: icon_classes
        } <- events_listing()}
        <Components.Card label={name} padding={:lg}>
          <Svg.IconSymbol name={icon} class={icon_classes} size={:md} />

          <div class="">
            <p class="">{theme}</p>
            <p class="font-light text-xl lg:text-3xl py-4">{Timex.format!(date, "{WDshort}, {Mshort} {D}")}</p>
            <p class="text-center lg:text-xl border">{description}</p>
          </div>
        </Components.Card>
      {/for}
    </div>
    """
  end
end
