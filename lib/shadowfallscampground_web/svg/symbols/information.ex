defmodule ShadowfallscampgroundWeb.Svg.Symbols.Information do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="information" viewBox="-255 347 100 100">
      <g class="fill-current">
        <path d="M-207.7,385.7c2.8,0,5.5,0,8.3,0c2,0,3.2,0.9,3.2,2.9c0,1.6-0.2,3.3-0.5,4.9c-1.1,6-2.2,12.1-3.3,18.1     c-0.4,2-0.8,4-1,6c-0.1,1,0,2,0.3,2.9c0.3,1.3,1.3,2,2.6,1.8c1.1-0.1,2.1-0.5,3.2-0.9c0.8-0.3,1.6-0.9,2.4-1.2     c1.2-0.5,2.3,0.4,1.9,1.6c-0.2,0.7-0.6,1.5-1.2,2c-3.1,3.1-6.8,5-11.2,5c-2.1,0-4.1,0-6.2-0.3c-3.4-0.5-7.7-4.7-7.1-9.1     c0.4-3.1,0.9-6.1,1.4-9.1c0.9-5.3,1.8-10.6,2.8-15.9c0.1-0.3,0.1-0.7,0.1-1c0-2.2-0.7-3-2.9-3.3c-0.9-0.1-1.9-0.2-2.8-0.5     c-1.1-0.4-1.6-1.2-1.5-2.1c0.1-0.9,0.7-1.5,1.9-1.7c0.6-0.1,1.3-0.1,1.9-0.1C-212.9,385.7-210.3,385.7-207.7,385.7z" />
        <path d="M-202.8,364.9c4.7,0,8.4,3.8,8.4,8.6c0,4.7-3.8,8.5-8.4,8.5c-4.7,0-8.5-3.9-8.5-8.6     C-211.3,368.7-207.5,364.9-202.8,364.9z" />
      </g>
    </SymbolTemplate>
    """
  end
end
