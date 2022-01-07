defmodule ShadowfallscampgroundWeb.Svg.Symbols.Laundry do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="laundry" viewBox="0 0 278 176">
      <rect x="6.42468" y="30.2313" width="132.099" height="138.907" stroke-width="12" />
      <rect x="139.425" y="30.2313" width="132.099" height="138.907" stroke-width="12" />
      <circle cx="206.496" cy="101.3" r="33.145" stroke-width="12" />
      <circle cx="71.496" cy="101.3" r="33.145" stroke-width="12" />
      <path
        d="M41.2716 107.06C44.2973 101.008 49.9142 91.8194 60.5604 94.2952C72.7578 97.1317 61.4114 94.2952 79.5656 101.103C94.089 106.549 101.786 99.9684 102.542 94.2952"
        stroke-width="5"
      />
      <rect x="5.42468" y="5.68756" width="134.099" height="24.9477" stroke-width="10" />
      <rect x="138.425" y="5.68756" width="134.099" height="24.9477" stroke-width="10" />
      <circle class="fill-current" cx="26.805" cy="17.7071" r="3.68755" />
      <circle class="fill-current" cx="36.805" cy="17.7071" r="3.68755" />
      <circle class="fill-current" cx="240.805" cy="17.7071" r="3.68755" />
      <circle class="fill-current" cx="253.805" cy="17.7071" r="3.68755" />
    </SymbolTemplate>
    """
  end
end
