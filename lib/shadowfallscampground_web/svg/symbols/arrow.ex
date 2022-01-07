defmodule ShadowfallscampgroundWeb.Svg.Symbols.Arrow do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="arrow" viewBox="0 0 200 140">
      <g stroke-width="20">
        <line x1="10" y1="90" x2="100" y2="10" stroke-linecap="round" />
        <line x1="190" y1="90" x2="100" y2="10" stroke-linecap="round" />
      </g>
    </SymbolTemplate>
    """
  end
end
