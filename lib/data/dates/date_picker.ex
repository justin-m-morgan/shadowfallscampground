defmodule Shadowfallscampground.Data.Dates.DatePicker do
  @moduledoc """
  Configuring dates to be displayed in date-picker
  """

  @doc """
  Generates ranges for date-range picker.

  *min_date* -  Start of eligible dates for picker
  *max_date* -  End of eligible dates for picker
  *focused_start_date* -  Date to focus start_day options
  *focused_end_date* -  Date to focus end_day options
  """
  def generate_dates(min_date, max_date, focused_start_date \\ nil, focused_end_date \\ nil) do
    focused_start_date =
      cond do
        is_nil(focused_start_date) -> min_date
        Timex.before?(focused_start_date, max_date) -> focused_start_date
        true -> max_date
      end

    focused_end_date = focused_end_date || Date.add(focused_start_date, 1)

    start_max_date = Date.add(max_date, -1)
    end_min_date = Date.add(focused_start_date, 1)
    end_max_date = Date.add(max_date, 1)

    %{
      start_month_range: start_month_range(min_date, start_max_date),
      start_day_range: start_day_range(min_date, max_date, focused_start_date),
      end_month_range: end_month_range(end_min_date, max_date),
      end_day_range: end_day_range(end_min_date, end_max_date, focused_end_date)
    }
  end

  defp start_month_range(min, max), do: Date.range(min, max)

  defp start_day_range(min, max, focused_start_date) do
    start_range = later_of(min, Date.beginning_of_month(focused_start_date))
    end_range = earlier_of(Date.end_of_month(start_range), max)

    Date.range(start_range, end_range)
  end

  defp end_month_range(min, max), do: Date.range(min, max)

  defp end_day_range(min, max, focused_end_date) do
    start = later_of(min, Date.beginning_of_month(focused_end_date))
    finish = earlier_of(max, Date.end_of_month(start))

    Date.range(start, finish)
  end

  @doc "Return the earlier of two dates"
  @spec earlier_of(Date.t(), Date.t()) :: Date.t()
  def earlier_of(date1, date2) do
    case Date.compare(date1, date2) do
      :lt -> date1
      _ -> date2
    end
  end

  @doc "Return the later of two dates"
  @spec later_of(Date.t(), Date.t()) :: Date.t()
  def later_of(date1, date2) do
    case Date.compare(date1, date2) do
      :gt -> date1
      _ -> date2
    end
  end
end
