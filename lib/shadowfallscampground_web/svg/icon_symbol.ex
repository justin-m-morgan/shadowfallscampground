defmodule ShadowfallscampgroundWeb.Svg.IconSymbol do
  @moduledoc """
  SVG Symbol component
  """
  use Surface.Component, slot: "icon"

  prop class, :css_class

  prop size, :atom, default: :custom, values: [:custom, :xs, :sm, :md, :lg, :xl, :xxl]

  prop name, :string,
    required: true,
    values: [
      "logo_hummingbird",
      "about_us",
      "arrow",
      "burger",
      "calculator",
      "camera",
      "checkbox",
      "checkmark",
      "cookpot",
      "disco",
      "dog",
      "easter",
      "envelope",
      "ev_charger",
      "facebook",
      "faq",
      "fire_ring",
      "firewood",
      "hand",
      "ice",
      "information",
      "laundry",
      "map_pin",
      "page_curl_arrow",
      "pig",
      "potable_water",
      "power",
      "power_bolt",
      "reply",
      "sewer",
      "showers",
      "washrooms",
      "wifi",
      "rv",
      "fifthwheel",
      "trailer",
      "tent",
      "day_visit",
    ]

  def render(assigns) do
    ~F"""
    <svg class={icon_size(@size), @class}>
      <use xlink:href={"#icon-" <> @name} />
    </svg>
    """
  end

  defp icon_size(:xs), do: "h-4 w-4"
  defp icon_size(:sm), do: "h-8 w-8"
  defp icon_size(:md), do: "h-16 w-16"
  defp icon_size(:lg), do: "h-32 w-32"
  defp icon_size(:xl), do: "h-64 w-64"
  defp icon_size(:xxl), do: "h-96 w-96"
  defp icon_size(:custom), do: nil
end
