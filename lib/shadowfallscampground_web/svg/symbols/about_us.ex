defmodule ShadowfallscampgroundWeb.Svg.Symbols.AboutUs do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="about_us" viewBox="0 0 176 146">
      <path
        class="fill-current"
        d="M106.774 57.9901L101.885 83.5951C99.2361 97.4707 109.872 110.33 123.998 110.33H148.747C162.588 110.33 173.151 97.9577 170.982 84.2879L166.572 56.505C165.113 47.31 153.874 43.6067 147.234 50.1332C143.125 54.1718 136.656 54.5294 132.127 50.9682L130.007 49.3009C121.454 42.5747 108.814 47.3018 106.774 57.9901Z"
      />
      <circle class="fill-current" cx="136.684" cy="21.0114" r="20.7037" />
      <path
        class="fill-current"
        d="M14.0443 75.5827L7.52999 109.704C3.99985 128.194 18.1733 145.33 36.9977 145.33H69.9779C88.4221 145.33 102.498 128.843 99.607 110.627L93.7307 73.6038C91.7859 61.3506 76.8089 56.4157 67.9611 65.1128C62.4859 70.4946 53.865 70.9711 47.8302 66.2254L45.0048 64.0037C33.6065 55.0405 16.7635 61.3396 14.0443 75.5827Z"
      />
      <circle class="fill-current" cx="57.1583" cy="29.0515" r="27.3332" />
    </SymbolTemplate>
    """
  end
end
