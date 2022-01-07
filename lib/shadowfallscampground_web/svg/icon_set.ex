defmodule ShadowfallscampgroundWeb.Svg.IconSet do
  @moduledoc """
  Icon sprite sheet
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Svg.Symbols

  def render(assigns) do
    ~F"""
    <svg style="display: none;">
      {!-- Common Icons --}
      <Symbols.AboutUs />
      <Symbols.Arrow />
      <Symbols.Calculator />
      <Symbols.Camera />
      <Symbols.Checkbox />
      <Symbols.Checkmark />
      <Symbols.Dog />
      <Symbols.Envelope />
      <Symbols.Facebook />
      <Symbols.Faq />
      <Symbols.Hand />
      <Symbols.Information />
      <Symbols.MapPin />
      <Symbols.PageCurlArrow />
      <Symbols.Reply />
      <Symbols.Rules />

      {!-- Services --}
      <Symbols.EvCharger />
      <Symbols.FireRing />
      <Symbols.Firewood />
      <Symbols.Ice />
      <Symbols.Laundry />
      <Symbols.PotableWater />
      <Symbols.PowerBolt />
      <Symbols.Sewer />
      <Symbols.Showers />
      <Symbols.Washrooms />
      <Symbols.Wifi />

      {!-- Type of Unit Icons --}

      <Symbols.Rv />
      <Symbols.Trailer />
      <Symbols.FifthWheel />
      <Symbols.Tent />
      <Symbols.DayVisit />

      {!-- Event Icons --}
      <Symbols.Easter />
      <Symbols.Burger />
      <Symbols.Disco />
      <Symbols.Cookpot />
      <Symbols.Pig />
    </svg>
    """
  end
end
