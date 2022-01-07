defmodule ShadowfallscampgroundWeb.Svg.Symbols.Checkbox do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate
      id="checkbox"
      class="h-full custom-checkbox__svg-checkbox stroke-current"
      viewBox="0 0 216 215"
    >
      <mask id="path-1-inside-1" fill="white">
        <rect x="0.878784" y="0.221802" width="214.223" height="214.223" rx="20" />
      </mask>
      <rect
        class="custom-checkbox__box"
        x="0.878784"
        y="0.221802"
        width="214.223"
        height="214.223"
        rx="20"
        stroke-width="52"
        mask="url(#path-1-inside-1)"
      />
      <path
        class="custom-checkbox__check"
        d="M51.3803 98.5716L90.8615 141.873L163.902 53.4661"
        stroke-width="26"
      />
    </SymbolTemplate>
    """
  end
end
