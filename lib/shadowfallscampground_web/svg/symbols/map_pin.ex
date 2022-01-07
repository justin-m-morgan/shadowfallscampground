defmodule ShadowfallscampgroundWeb.Svg.Symbols.MapPin do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="map_pin" viewBox="0 0 153 215">
      <path
        d="M28.976 70.1051L75.4476 170.124L119.373 70.1051C126.376 45.9871 115.171 7.79114 75.4476 7.79114C35.7239 7.79114 21.9735 49.8066 28.976 70.1051Z"
        stroke-width="15"
      />
      <circle cx="74.5676" cy="54.2629" r="13.3711" stroke-width="14" />
      <path
        d="M109.639 167.238C124.33 169.919 135.533 174.2 141.919 179.015C145.084 181.402 146.607 183.572 147.178 185.278C147.688 186.801 147.59 188.366 146.522 190.214C145.362 192.222 143.048 194.528 139.225 196.871C135.446 199.188 130.463 201.375 124.359 203.272C112.145 207.069 96.6147 209.342 80.2015 209.648C63.7968 209.953 47.6624 208.272 34.3482 204.924C20.8081 201.52 11.7813 196.794 7.69649 192.149C5.76718 189.956 5.26411 188.164 5.3358 186.771C5.40959 185.337 6.1391 183.435 8.40473 181.157C13.1076 176.427 22.7562 171.803 36.6289 168.587"
        stroke-width="10"
      />
    </SymbolTemplate>
    """
  end
end
