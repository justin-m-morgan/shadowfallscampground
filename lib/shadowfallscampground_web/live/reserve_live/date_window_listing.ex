defmodule ShadowfallscampgroundWeb.ReserveLive.DateWindowListing do
  @moduledoc """
  Listing of staggered dates for opening of bookings
  """

  use ShadowfallscampgroundWeb, :component

  def render(assigns) do
    ~F"""
    <p class="font-bold text-xl lg:text-3xl text-center">
      Reservations for the 2022 season will begin on April 1, 2022.
    </p>

    <div class="space-y-2">
      <h2 class="font-bold text-md lg:text-xl">Staggered Date Openings</h2>
      <p>In order to give us time to process requests, and not give away all our sites months before the season, we will again be staggering the opening of blocks of time. We will begin taking reservations for the following dates as follows:</p>

      <table class="border w-full">
        <thead>
          <tr>
            <th class="py-1">Bookings Begin</th>
            <th>For Dates</th>
          </tr>
        </thead>
        {#for {date_window, starting_date} <- booking_date_openings()}
          <tr>
            <td class="text-center">{starting_date}</td>
            <td class="text-center">{date_window}</td>
          </tr>
        {/for}
      </table>
      <p>If your dates fall in two date-windows and are only in the earlier window by one or two days, please submit your request for the later window.</p>
    </div>
    """
  end

  defp booking_date_openings(
         start_of_season \\ ~D[2022-05-12],
         booking_opening_date \\ ~D[2022-04-01],
         window_length \\ 21,
         booking_date_offset \\ 7,
         end_of_season_date \\ ~D[2022-09-21]
       ) do
    {start_of_season, booking_opening_date}
    |> build_date_list(end_of_season_date, window_length, booking_date_offset)
    |> Enum.map(fn {start_of_window, opening_date} ->
      {format_date_window(start_of_window, window_length - 1), format_date(opening_date)}
    end)
  end

  defp build_date_list(
         {window_start_date, opening_date},
         take_until_end_date,
         window_length,
         opening_offset
       ) do
    Stream.iterate(
      {window_start_date, opening_date},
      fn {window_start, opening} ->
        {Date.add(window_start, window_length), Date.add(opening, opening_offset)}
      end
    )
    |> Enum.take_while(fn {window_start, _opening} ->
      window_start |> Date.add(window_length) |> Timex.before?(take_until_end_date)
    end)
  end

  defp format_date_window(start_date, ahead) do
    "#{format_date(start_date)} - #{Date.add(start_date, ahead) |> format_date()}"
  end

  defp format_date(date), do: Timex.format!(date, "{Mshort} {D}")
end
