defmodule ShadowfallscampgroundWeb.Svg.Symbols.Power do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="power" viewBox="0 0 162 161">
      <circle cx="80.9957" cy="80.3194" r="73.7812" fill="white" stroke="black" stroke-width="13" />
      <path
        d="M46.7104 82.8396L100.231 24.6218C101.676 23.0499 104.248 24.5327 103.612 26.5709L90.838 67.5175C90.4363 68.8051 91.3984 70.1131 92.7473 70.1131H113.975C115.69 70.1131 116.61 72.1308 115.485 73.4253L61.4788 135.548C60.0646 137.174 57.4319 135.721 58.0547 133.657L71.6031 88.7711C71.9907 87.4872 71.0296 86.1932 69.6885 86.1932H48.1827C46.4412 86.1932 45.5317 84.1217 46.7104 82.8396Z"
        fill="#FAFF00"
      />
    </SymbolTemplate>
    """
  end
end
