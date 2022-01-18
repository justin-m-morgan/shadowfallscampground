defmodule ShadowfallscampgroundWeb.Sections.Sites do
  @moduledoc """

  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallsWeb.Live.PageLive.BadgedCard
  alias ShadowfallsWeb.Live.Ui.{Grid}

  alias Shadowfallscampground.Data.Prices


  defstruct [:label, :copy, :prices, :icon]

  def render(assigns) do
    ~F"""
    <div class="grid md:grid-cols-3 gap-8">
      {#for %__MODULE__{icon: icon, label: label, copy: copy, prices: prices} <- [
          rv_copy(),
          tent_copy(),
          day_copy()
        ]}
        <Components.Card label={label} padding={:lg}>
          <Svg.IconSymbol name={icon} size={:md} />
          <p class="py-3 lg:text-xl">{copy}</p>
          <ul>
            {#for {amount, p_label} <- prices}
              <li class="flex flex-col items-center"><strong class="text-3xl">{Money.parse!(amount, :CAD)}</strong> <span>{p_label}</span></li>
            {/for}
          </ul>
        </Components.Card>
      {/for}
    </div>
    """
  end

  defp day_copy() do
    %__MODULE__{
      icon: "day_visit",
      label: "Day Visit",
      copy:
        "You don't need to have a tent or rv to enjoy the space. All day visitors must leave the campground by 10pm. You may attend one of our events as a day visitor for an additional fee.",
      prices: [
        {Prices.day_visitor(), "per person"},
        {Prices.day_visitor_event(), "(events) extra per person "}
      ]
    }
  end

  defp rv_copy() do
    %__MODULE__{
      icon: "rv",
      label: "RV Sites",
      copy:
        "Our RV sites can accomodate many sizes, up to 45' motorhomes. With a few exceptions, our sites are all serviced with 30A electrical, sewer, and potable water.",
      prices: [
        {Prices.rv_night(), "per person per night"},
        {Prices.rv_utilities(), "utilities per night"}
      ]
    }
  end

  defp tent_copy() do
    %__MODULE__{
      icon: "tent",
      label: "Tent Sites",
      copy:
        "All of our tenting sites have a fire-ring and acceess to power on the site (upon request). Our tenting sites vary in size, some accomodating groups of at least 10 people.",
      prices: [
        {Prices.tent_night(), "per person per night"},
        {Prices.tent_power(), "(optional) utilities per night"}
      ]
    }
  end
end
