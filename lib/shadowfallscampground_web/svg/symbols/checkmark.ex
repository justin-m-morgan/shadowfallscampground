defmodule ShadowfallscampgroundWeb.Svg.Symbols.Checkmark do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="checkmark" viewBox="0 0 119 120">
      <path d="M10.8135 59.6491L43.2715 98.5988L108.188 7.71619" stroke-width="26" />
    </SymbolTemplate>
    """
  end
end
