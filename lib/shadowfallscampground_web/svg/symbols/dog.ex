defmodule ShadowfallscampgroundWeb.Svg.Symbols.Dog do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="dog" class="fill-current" viewBox="10 25 85 50">
      <g>
        <g>
          <polygon points="6.82324,62.72705 9.80176,65.39795 19,55.14374 19,66 13.19501,73.625 19.19501,87 25,87     22.19501,77.125 25.7226,73.5484 32,87 37.08331,87 34.08331,77 39,68 48,68 48,87 53,87 58,68 58,43 24.5188,43" />
          <polygon points="75.39349,62.01361 62,48.62012 62,68 73,87 80,87 73,67" />
          <polygon points="87,33 83,27 74,27 62,43 77.22571,58.19641 85,42 92,42 94,34" />
          <polygon points="37,16 58,43 62,43 41,16" />
        </g>
      </g>
      <text
        x="0"
        y="115"
        fill="#000000"
        font-size="5px"
        font-weight="bold"
        font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"
      >Created by Yu luck</text>
      <text
        x="0"
        y="120"
        fill="#000000"
        font-size="5px"
        font-weight="bold"
        font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"
      >from the Noun Project</text>
    </SymbolTemplate>
    """
  end
end
