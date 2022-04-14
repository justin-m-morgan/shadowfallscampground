defmodule ShadowfallscampgroundWeb.ReserveLive.LotteryManager do
  @moduledoc """
  Encapsulation of lottery system
  """

  use ShadowfallscampgroundWeb, :component

  prop now, :struct
  prop season_start, :struct, default: ~D[2022-05-12]
  prop season_end, :struct, default: ~D[2022-09-14]
  prop lottery_open, :struct, default: ~D[2022-04-14]
  prop lottery_close, :struct, default: ~N[2022-04-15 23:59:00]
  prop lottery_period_end_date, :struct, default: ~D[2022-07-13]

  # prop lottery_dates,
  #      :list,
  #      default: [
  #        {~D[2022-04-01], ~D[2022-06-01]},
  #        {~D[2022-04-08], ~D[2022-06-22]},
  #        {~D[2022-04-15], ~D[2022-07-13]},
  #        {~D[2022-04-22], ~D[2022-08-03]},
  #        {~D[2022-04-29], ~D[2022-08-24]},
  #        {~D[2022-05-06], ~D[2022-09-14]}
  #      ]

  slot default,
    required: true,
    args: [
      :now,
      :season_start,
      :season_end,
      :lottery_open,
      :lottery_close,
      :lottery_period_start_date,
      :lottery_period_end_date
    ]

  def render(assigns) do
    ~F"""
    <div>
      <#slot :args={ now: @now,
        season_start: @season_start,
        season_end: @season_end,
        lottery_open: @lottery_open,
        lottery_close: @lottery_close,
        lottery_period_start_date: Timex.subtract(@lottery_period_end_date, Timex.Duration.from_days(20)),
        lottery_period_end_date: @lottery_period_end_date
        # lottery_open: exposed_dates(@now, @lottery_dates)[:lottery_open],
        # lottery_close: exposed_dates(@now, @lottery_dates)[:lottery_close],
        # lottery_period_start_date: exposed_dates(@now, @lottery_dates)[:lottery_period_start_date],
        # lottery_period_end_date: exposed_dates(@now, @lottery_dates)[:lottery_period_end_date],

      }/>
    </div>
    """
  end

  # defp pluck_correct_lottery_tuple(now, lottery_tuples) do
  #   Enum.find(lottery_tuples, fn {lottery_open, lottery_period_end} ->
  #     not Timex.before?(now, lottery_open)
  #   end)
  # end

  # defp exposed_dates(now, lottery_tuples) do
  #   {lottery_open, lottery_period_end_date} = pluck_correct_lottery_tuple(now, lottery_tuples)

  #   %{
  #     lottery_open: lottery_open,
  #     lottery_close: Timex.add(lottery_open, Timex.Duration.from_days(1)),
  #     lottery_period_end_date: lottery_period_end_date
  #   }
  # end

  # defp pluck_lottery_opening(now, lottery_tuples) do
  #   now
  #   |> pluck_correct_lottery_tuple(lottery_tuples)
  #   |> elem(0)
  # end

  # defp pluck_lottery_period_end_date(now, lottery_tuples) do
  #   now
  #   |> pluck_correct_lottery_tuple(lottery_tuples)
  #   |> elem(1)
  # end

  # defp stringdate_to_date(%Date{} = date), do: date

  # defp stringdate_to_date(string_date) when is_binary(string_date) do
  #   string_date
  #   |> Timex.parse!("{YYYY}-{0M}-{0D}")
  # end

  # defp datetime_to_tz(datetime_string) when is_binary(datetime_string) do
  #   datetime_string
  #   # |> Timex.parse!("{YYYY}-{MM}-{DD}")
  #   |> datetime_to_tz()
  # end

  def humanized_duration(time_before, time_until) do
    Timex.diff(time_until, time_before, :seconds)
    |> Timex.Duration.from_seconds()
    |> Timex.format_duration(:humanized)
    |> String.replace(~r/, \d{1,2} (?:second)?s/, "")

    #   |> String.split(",")

    # if length(components) > 1 do
    #   components
    #   |> Enum.reverse()
    #   |> Enum.drop(1)
    #   |> Enum.reverse()
    #   |> Enum.join(", ")
    # else
    #   Enum.join(components, ", ")
    # end
  end
end
