defmodule ShadowfallscampgroundWeb.Sections.Services do
  @moduledoc """

  """
  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Data.Prices

  defstruct [:icon, :label, :description]

  def render(assigns) do
    ~F"""
    <div class="grid md:grid-cols-3 gap-8">
      {#for %{icon: icon, label: label, description: description} <- services()}
        <Components.Card label={label} padding={:xl}>
          <Svg.IconSymbol name={icon} size={:md} />
          <p class="lg:text-xl lg:py-4">{description}</p>
        </Components.Card>
      {/for}
    </div>
    """
  end

  defp services() do
    [
      %__MODULE__{
        icon: "wifi",
        label: "WiFi",
        description:
          "We have a shared rural connection, but it will let you stay connected."
      },
      %__MODULE__{
        icon: "washrooms",
        label: "Washrooms",
        description: "Real washrooms, with flush toilets and everything!"
      },
      %__MODULE__{
        icon: "showers",
        label: "Warm Showers",
        description:
          "Showers are coin operated. $1 gets you 7 minutes. Loonies only (change available on site)."
      },
      %__MODULE__{
        icon: "power_bolt",
        label: "Electrical",
        description:
          "All RV sites have electricity and most tenting sites even have (optional) electrical service."
      },
      %__MODULE__{
        icon: "firewood",
        label: "Firewood",
        description:
          "Bundles of firewood are available for sale ($10 a bundle). (You are free to bring your own)"
      },
      %__MODULE__{
        icon: "ev_charger",
        label: "EV Charger",
        description:
          "Level 2 (AC 30 Amp) EV Charger is publicly available at the owners' residence."
      },
      %__MODULE__{
        icon: "potable_water",
        label: "Potable Water",
        description: "We have a 150 ft deep well that services all of our taps."
      },
      %__MODULE__{
        icon: "laundry",
        label: "Laundry",
        description:
          "Coin operated washer and dryer are located in the Clubhouse (separate entrance)."
      },
      %__MODULE__{
        icon: "ice",
        label: "Cube Ice",
        description:
          "We stock Hope Ice bagged cube ice. #{Prices.ice_cube() |> Prices.to_string()} per bag."
      }
    ]
  end
end
