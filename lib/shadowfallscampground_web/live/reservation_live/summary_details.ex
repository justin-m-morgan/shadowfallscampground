defmodule ShadowfallscampgroundWeb.ReservationLive.SummaryDetails do
  @moduledoc """
  A template for summarizing the details of a reservation request.
  """

  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Data.Dates

  prop camper_struct, :struct, required: true

  prop reservation_struct, :struct, required: true

  prop tent_details_struct, :struct, required: true

  prop rv_details_struct, :struct, required: true

  def render(assigns) do
    ~F"""
    <div class="space-y-12">
      <div class="text-center">
        <h2 class="text-3xl font-bold">Request Summary</h2>
        <p>Please review the details of your request for any errors</p>
      </div>
      <div><h3 class="text-xl font-bold">Camper Details</h3>

        <h4 class="font-bold">Attendees for this Request</h4>
        <ul>
          <li>{@camper_struct.name}</li>
        </ul>
      </div>
      <div>
        <h3 class="text-xl font-bold">Request Details</h3>
        {#case @reservation_struct.type_of_request}
          {#match :tent}
            <p>A tenting site</p>

            <p>from {pretty_date(@reservation_struct.arrival)} to {pretty_date(@reservation_struct.departure)}
              <span class="font-bold">({duration(@reservation_struct.arrival, @reservation_struct.departure)} nights)</span></p>
            <p>with {@tent_details_struct.number_of_people} people in {@tent_details_struct.number_of_tents} tents</p>
            <p :if={@tent_details_struct.power_requested}>and power on site, please</p>
          {#match :rv}
            <p>An RV site for a {rv_details(@rv_details_struct)}</p>
            <p>from {pretty_date(@reservation_struct.arrival)} to {pretty_date(@reservation_struct.departure)}
              <span class="font-bold">({duration(@reservation_struct.arrival, @reservation_struct.departure)} nights)</span></p>
        {/case}
      </div>

      <div>
        <h2 class="font-bold">Email for communication (double check before submitting)</h2>
        <p class="text-4xl">{@camper_struct.email}</p>
      </div>
    </div>
    """
  end

  defp rv_details(rv_details_struct) do
    "#{rv_details_struct.length_of_unit}' #{rv_details_struct.type_of_unit}"
  end

  defp pretty_date(date) do
    Dates.Formatting.pretty_date(date)
  end

  defp duration(arrival, departure) do
    Dates.Formatting.duration({departure, arrival})
  end
end
