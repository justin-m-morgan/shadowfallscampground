defmodule ShadowfallscampgroundWeb.Svg.Symbols.PotableWater do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="potable_water" viewBox="0 0 181 298">
      <path d="M97.1516 290.372L77.3959 171.837H172.411L158.3 290.372H97.1516Z" stroke-width="15" />
      <path
        d="M86.8034 215.112C90.2528 209.467 100.538 199.872 114.085 206.645C127.632 213.418 132.619 215.112 139.204 215.112C148.612 215.112 164.509 204.387 170.53 199.119"
        stroke-width="12"
      />
      <path
        d="M115.341 136.836L122.569 113.849C122.868 112.899 124.219 112.921 124.486 113.881L130.887 136.893C130.906 136.961 130.918 137.029 130.922 137.1C131.106 140.744 129.899 147.922 123.582 148.296C117.292 148.667 115.448 141.131 115.296 137.16C115.292 137.049 115.307 136.941 115.341 136.836Z"
        stroke-width="7"
      />
      <line x1="107.493" y1="91.1282" x2="138.99" y2="91.1282" stroke-width="19" />
      <ellipse class="fill-current" cx="64.1677" cy="55.8005" rx="19.7714" ry="19.8392" />
      <line x1="62.6017" y1="56.659" x2="62.6017" y2="9.76451" stroke-width="10" />
      <path d="M15.322 11.8407H62.9716H112.237" stroke-width="8" />
      <circle class="fill-current" cx="20.7973" cy="11.4877" r="10.9029" />
      <circle class="fill-current" cx="108.363" cy="11.4877" r="10.9029" />
      <path
        d="M0.784729 56.6605H86.3926C99.3146 57.4681 124.674 66.1905 122.736 94.6187"
        stroke-width="22"
      />
    </SymbolTemplate>
    """
  end
end
