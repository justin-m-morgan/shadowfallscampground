defmodule ShadowfallscampgroundWeb.Svg.Symbols.DayVisit do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="day_visit" viewBox="0 0 214 305">
      {!-- legs --}
      <path
        d="M77.0006 289V230C77.0006 219.507 85.5072 211 96.0006 211V211C106.494 211 115.001 219.507 115.001 230V250V289"
        stroke-width="32"
        stroke-linecap="round"
      />
      {!-- torso --}
      <path
        class="fill-current"
        d="M61.0006 138.5C61.0006 128.007 69.5072 119.5 80.0006 119.5H112.001C122.494 119.5 131.001 128.007 131.001 138.5V226.5H61.0006V138.5Z"
      />
      {!-- waving arm --}
      <path
        d="M77.0006 131.708L35.5391 168.5L12.5 123"
        stroke-width="23"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
      {!-- straight arm --}
      <path d="M117.501 130L163.001 190.5" stroke-width="23" stroke-linecap="round" />
      {!-- head --}
      <circle class="fill-current" cx="96.0006" cy="90.4999" r="25" />
      {!-- sun ball --}
      <circle cx="171.772" cy="48.5663" r="14.6641" stroke-width="9" />
      {!-- sun beams --}
      <circle
        cx="171.771"
        cy="48.5664"
        r="30.9248"
        transform="rotate(0 171.771 48.5664)"
        stroke-width="15"
        stroke-miterlimit="2.61313"
        stroke-dasharray="8 16"
      />
    </SymbolTemplate>
    """
  end
end
