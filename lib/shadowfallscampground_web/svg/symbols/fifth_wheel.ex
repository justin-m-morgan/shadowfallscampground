defmodule ShadowfallscampgroundWeb.Svg.Symbols.FifthWheel do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="fifthwheel" viewBox="0 0 242 162">
      <path
        d="M50.5643 146.054H23.2749C13.3338 146.054 5.2749 137.995 5.2749 128.054V68.1426C5.2749 33.3486 33.481 5.14258 68.2749 5.14258H188.771C215.281 5.14258 236.771 26.6329 236.771 53.1426V59.0499C236.771 72.3047 226.026 83.0499 212.771 83.0499H207.365C199.633 83.0499 193.365 89.3179 193.365 97.0499V120.054C193.365 134.413 181.725 146.054 167.365 146.054H134.721C128.385 146.054 123.249 140.918 123.249 134.582C123.249 121.488 112.634 110.874 99.5408 110.874H85.744C72.6504 110.874 62.036 121.488 62.036 134.582C62.036 140.918 56.8999 146.054 50.5643 146.054Z"
        stroke-width="10"
      />
      <circle cx="92.277" cy="139.935" r="16.25" stroke-width="10" />
      <rect x="40.527" y="51.1849" width="41" height="19.5" rx="5.5" stroke-width="7" />
      <line
        x1="216.027"
        y1="101.693"
        x2="216.027"
        y2="87.6927"
        stroke-width="10"
        stroke-linecap="round"
      />
      <path
        d="M140.027 110.685V64.6849C140.027 56.953 146.295 50.6849 154.027 50.6849H156.527C164.259 50.6849 170.527 56.953 170.527 64.6849V110.685C170.527 118.417 164.259 124.685 156.527 124.685H154.027C146.295 124.685 140.027 118.417 140.027 110.685Z"
        stroke-width="8"
      />
    </SymbolTemplate>
    """
  end
end
