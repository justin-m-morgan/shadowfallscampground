defmodule ShadowfallscampgroundWeb.Svg.Symbols.Washrooms do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="washrooms" viewBox="0 0 146 179">
      <path
        d="M3.93079 170.038V88.2965C3.93079 85.5351 6.16937 83.2965 8.93079 83.2965H21.5119C23.8568 83.2965 25.8867 84.9261 26.3937 87.2156L33.8919 121.078C34.3988 123.368 36.4287 124.997 38.7736 124.997H87.9825C91.2648 124.997 93.6568 128.106 92.8154 131.279L87.5682 151.065C86.9869 153.257 85.0031 154.784 82.7353 154.784H63.1021C61.1653 154.784 59.4027 155.902 58.5781 157.655L51.7486 172.167C50.9239 173.92 49.1613 175.038 47.2245 175.038H8.93079C6.16936 175.038 3.93079 172.8 3.93079 170.038Z"
        stroke-width="6"
      />
      <path
        d="M101.475 168.485L117.56 106.53H51.4343L63.9445 54.7016H91.9437L111.007 72.5734H137.815"
        stroke-width="16"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
      <path d="M79.8744 54.7016L67.9599 105.934" stroke-width="16" />
      <circle class="fill-current" cx="81.209" cy="20.4473" r="19.9569" />
    </SymbolTemplate>
    """
  end
end
