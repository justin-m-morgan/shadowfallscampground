defmodule ShadowfallscampgroundWeb.Svg.Symbols.Closed do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="closed" viewBox="0 0 100 100">
      <path
        class="fill-current"
        d="M91,33h-8v-2v-6c0-5.5-4.5-10-10-10H57V9h4c1.1,0,2-0.9,2-2s-0.9-2-2-2h-6H45h-6c-1.1,0-2,0.9-2,2s0.9,2,2,2h4v6H27  c-5.5,0-10,4.5-10,10v6v2H9c-1.1,0-2,0.9-2,2s0.9,2,2,2h8v52c0,3.3,2.7,6,6,6h54c3.3,0,6-2.7,6-6V37h8c1.1,0,2-0.9,2-2  S92.1,33,91,33z M47,9h6v6h-6V9z M21,25c0-3.3,2.7-6,6-6h18h10h18c3.3,0,6,2.7,6,6v4H21V25z M79,89c0,1.1-0.9,2-2,2H23  c-1.1,0-2-0.9-2-2V33h58V89z M58,77c0,1.1-0.9,2-2,2H44c-1.1,0-2-0.9-2-2s0.9-2,2-2h12C57.1,75,58,75.9,58,77z M58,67  c0,1.1-0.9,2-2,2H44c-1.1,0-2-0.9-2-2s0.9-2,2-2h12C57.1,65,58,65.9,58,67z"
      />
      <text
        x="0"
        y="115"
        fill="#000000"
        font-size="5px"
        font-weight="bold"
        font-family="'Helvetica Neue', Helvetica, Arial-Unicode, Arial, Sans-serif"
      >Created by IconMark</text><text
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
