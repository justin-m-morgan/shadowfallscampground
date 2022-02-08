defmodule ShadowfallscampgroundWeb.ReservationLive.SummaryPrices do
  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Data.Prices
  alias Shadowfallscampground.Requests.Reservation

  prop reservation_struct, :struct, required: true

  def render(assigns) do
    ~F"""
    <div class="text-center">
      <h2 class="text-3xl font-bold">Cost Summary</h2>
      <table class="border w-full">
        <tbody>
          {#for {col1, col2, col3} <-
              cost_table_items(@reservation_struct)}
            <tr class="odd:bg-primary-100 text-xl">
              <td class="text-left py-3 px-4">{col1}</td>
              <td class="py-3 px-4">{col2}</td>
              <td class="text-right py-3 px-4">{pricify(col3)}</td>
            </tr>
          {/for}
          <tr>
            <td />
            <td>Subtotal:</td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end

  defp cost_table_items(reservation_struct) do
    [
      people_cost_row(reservation_struct),
      utility_cost_row(reservation_struct)
    ]
  end

  defp people_cost_row(reservation_struct) do
    label = "People Cost:"
    unit_price = "#{person_unit_price(reservation_struct.type_of_request)} per person/night"
    extended_price = person_extended_price(reservation_struct)

    {label, unit_price, extended_price}
  end

  defp person_extended_price(reservation_struct) do
    reservation_struct
    |> extract_number_of_people()
    |> Kernel.*(Prices.person_night(reservation_struct.type_of_request))
    |> Kernel.*(stay_duration(reservation_struct))
  end

  defp stay_duration(%Reservation{} = reservation_struct) do
    {reservation_struct.arrival, reservation_struct.departure}
    |> then(fn {arrival, departure} -> Timex.diff(departure, arrival, :days) end)
  end

  defp person_unit_price(type_of_request) do
    type_of_request
    |> Prices.person_night()
    |> Prices.to_string()
  end

  defp utility_cost_row(reservation_struct) do
    label = "Power/Utilities"
    unit_price = utility_unit_price(reservation_struct)

    extended_price =
      case reservation_struct.type_of_request do
        :tent -> utility_extended_price(reservation_struct)
        :rv -> utility_extended_price(reservation_struct)
      end

    {label, unit_price, extended_price}
  end

  defp utility_unit_price(reservation_struct) do
    reservation_struct.type_of_request
    |> Prices.power_price()
    |> Prices.to_string()
  end

  defp utility_extended_price(%{
         type_of_request: :tent,
         tent_details: %{power_requested: false}
       }),
       do: 0

  defp utility_extended_price(reservation_struct) do
    reservation_struct
    |> stay_duration()
    |> Kernel.*(Prices.power_price(reservation_struct.type_of_request))
  end

  defp pricify(value) when is_float(value) or is_integer(value), do: Prices.to_string(value)
  defp pricify(value), do: value

  defp total(reservation_struct) do
    cost_table_items(reservation_struct)
    |> Enum.reduce(fn {_, _, extended_price}, acc -> acc + extended_price end)
  end

  defp extract_number_of_people(reservation_struct) do
    case reservation_struct.type_of_request do
      :tent -> reservation_struct.tent_details.number_of_people
      :rv -> reservation_struct.rv_details.number_of_people
    end
  end
end
