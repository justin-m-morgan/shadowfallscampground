defmodule ShadowfallscampgroundWeb.Forms.DateRangeInput do
  @moduledoc """
  Pair of Date Inputs for selecting a range
  """
  use ShadowfallscampgroundWeb, :live_component

  alias ShadowfallscampgroundWeb.Forms
  alias Shadowfallscampground.Data.Dates.DatePicker

  @doc "Field name"
  prop form, :map, required: true

  @doc "Start Date field name"
  prop start_date_field, :atom, required: true

  @doc "End Date field name"
  prop end_date_field, :atom, required: true

  @doc "Minimum Date to display"
  prop min_date, :date, required: true

  @doc "Maximum Date to display"
  prop max_date, :date, required: true

  @doc "Focus date for starting date input (determines date options)"
  prop focused_start_date, :date, required: true

  @doc "Focus date for ending date input (determines date options)"
  prop focused_end_date, :date, required: true

  @doc "Year provided from controlling component logic"
  prop year, :keyword

  @doc "Computed start_month options"
  data start_month_options, :keyword

  @doc "Computed start_day options"
  data start_day_options, :keyword

  @doc "Computed end_month options"
  data end_month_options, :keyword

  @doc "Computed end_day options"
  data end_day_options, :keyword

  @doc "Computed year from options"
  data computed_year, :date

  def render(assigns) do
    ~F"""
    <div>
      <Forms.DateInput
        form={@form}
        name={@start_date_field}
        year={@computed_year}
        month_options={@start_month_options}
        day_options={@start_day_options}
        focus_date={@focused_start_date || @min_date}
      />
      <Forms.DateInput
        form={@form}
        name={@end_date_field}
        year={@computed_year}
        month_options={@end_month_options}
        day_options={@end_day_options}
        focus_date={@focused_end_date || @min_date}
      />
    </div>
    """
  end

  @impl true
  def update(assigns, socket) do
    %{
      min_date: min_date,
      max_date: max_date,
      focused_start_date: focused_start_date,
      focused_end_date: focused_end_date
    } = assigns

    focused_end_date = maybe_bump_focus_day(focused_start_date, focused_end_date)
    options = DatePicker.generate_dates(min_date, max_date, focused_start_date, focused_end_date)
    year = assigns.year || options.start_month_range.first.year

    {
      :ok,
      socket
      |> assign(assigns)
      |> assign(:start_month_options, options.start_month_range)
      |> assign(:start_day_options, options.start_day_range)
      |> assign(:end_month_options, options.end_month_range)
      |> assign(:end_day_options, options.end_day_range)
      |> assign(:computed_year, year)
    }
  end

  defp maybe_bump_focus_day(nil, _), do: nil
  defp maybe_bump_focus_day(start_date, nil), do: Date.add(start_date, 1)

  defp maybe_bump_focus_day(start_date, end_date) do
    case Date.compare(start_date, end_date) do
      :gt -> Date.add(start_date, 1)
      _ -> end_date
    end
  end
end
