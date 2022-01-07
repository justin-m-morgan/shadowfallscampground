defmodule ShadowfallscampgroundWeb.Svg.Symbols.Tent do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="tent" viewBox="0 0 230 174">
      <line
        x1="11.8931"
        y1="162.741"
        x2="135.634"
        y2="12.019"
        stroke-width="12"
        stroke-linecap="round"
      />
      <line
        x1="8"
        y1="-8"
        x2="203.009"
        y2="-8"
        transform="matrix(-0.634536 -0.772893 -0.772893 0.634536 216.893 174)"
        stroke-width="12"
        stroke-linecap="round"
      />
      <line
        x1="11.5"
        y1="163.5"
        x2="218.125"
        y2="163.5"
        stroke-width="12"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
      <path d="M115 100C116.667 112.333 129.2 142.2 166 163" stroke-width="10" stroke-linecap="round" />
      <path d="M115 100C113.333 112.333 100.8 142.2 64 163" stroke-width="10" stroke-linecap="round" />
    </SymbolTemplate>
    """
  end
end
