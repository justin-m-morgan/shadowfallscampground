defmodule Shadowfallscampground.Data.Prices do
  @moduledoc """
  Functions for dealing with currency numbers
  """
  def person_night(), do: 17.5
  def tent_night(), do: person_night()
  def tent_power(), do: 5

  def rv_night(), do: person_night()
  def rv_utilities(), do: 5

  def day_visitor, do: 5
  def day_visitor_event, do: 5

  def ice_cube, do: 3.5
  def firewood, do: 10
  def propane_small, do: 7.5

  def people_price("tent"), do: tent_night()
  def people_price("rv"), do: tent_night()
  def people_price(_), do: 0

  def people_price(tor, people, nights) when is_binary(people),
    do: people_price(tor, parse_int(people), nights)

  def people_price(tor, people, nights) when is_binary(nights),
    do: people_price(tor, people, parse_int(nights))

  def people_price(tor, people, nights) do
    tor
    |> people_price()
    |> Kernel.*(people)
    |> Kernel.*(nights)
  end

  def power_price("tent"), do: tent_power()
  def power_price("rv"), do: rv_utilities()
  def power_price(_), do: 0

  def power_price(tor, nights) when is_binary(nights),
    do: power_price(tor, parse_int(nights))

  def power_price("tent", nights), do: tent_power() * nights
  def power_price("rv", nights), do: rv_utilities() * nights
  def power_price(_, _nights), do: 0

  def to_string(price), do: price |> Money.parse!(:CAD)

  defp parse_int(maybe_int) do
    case Integer.parse(maybe_int) do
      :error -> 0
      {int, _remainder} -> int
    end
  end
end
