defmodule ShadowfallscampgroundWeb.Svg.Symbols.Trailer do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="trailer" viewBox="0 0 244 170">
      <path
        d="M158.574 4.5H123.219C57.9283 4.5 5 57.4283 5 122.719C5 138.062 17.4381 150.5 32.7814 150.5H72.8421C76.7953 150.5 80 147.295 80 143.342C80 128.518 92.0176 116.5 106.842 116.5H113.055C128.489 116.5 141 129.011 141 144.445C141 147.789 143.711 150.5 147.055 150.5H171.111C203.228 150.5 229.14 124.23 228.7 92.1161L228.444 73.4192C227.921 35.2044 196.793 4.5 158.574 4.5Z"
        stroke-width="9"
      />
      <circle cx="109.75" cy="146.75" r="16.25" stroke-width="10" />
      <rect x="58" y="58" width="41" height="19.5" rx="5.5" stroke-width="7" />
      <line
        x1="214.654"
        y1="133.159"
        x2="236.659"
        y2="133.846"
        stroke-width="10"
        stroke-linecap="round"
      />
      <path
        d="M157.5 117.5V71.5C157.5 63.768 163.768 57.5 171.5 57.5H174C181.732 57.5 188 63.768 188 71.5V117.5C188 125.232 181.732 131.5 174 131.5H171.5C163.768 131.5 157.5 125.232 157.5 117.5Z"
        stroke-width="8"
      />
    </SymbolTemplate>
    """
  end
end
