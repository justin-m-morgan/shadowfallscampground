defmodule ShadowfallscampgroundWeb.Forms.DateInput do
  @moduledoc """
  Date Input for single date using separate select/option elements for month and day
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Forms.FormInput

  @doc "Field name"
  prop form, :map, required: true

  @doc "Field name"
  prop name, :atom, required: true

  @doc "Label text (computed from field name if not provided)"
  prop label, :string

  @doc "Month options provided from controlling component logic"
  prop month_options, :map, required: true

  @doc "Day options provided from controlling component logic"
  prop day_options, :map, required: true

  @doc "Year provided from controlling component logic"
  prop year, :integer, required: true

  @doc "Date to focus on for generating date options (and assigning value)"
  prop focus_date, :map, required: true

  def render(assigns) do
    ~F"""
    <FormInput name={@name} label={@label}>
      {Phoenix.HTML.Form.date_select(@form, @name,
        builder: builder(@month_options, @day_options, @year, @focus_date)
      )}
    </FormInput>
    """
  end

  defp builder(month_options, day_options, year, focus_date) do
    fn b ->
      assigns = %{b: b}

      ~H"""
      <%= @b.(:month, options: month_options(month_options), value: focus_date.month, class: "rounded-md") %>
      <%= @b.(:day, options: Enum.map(day_options, &map_day_option/1), value: focus_date.day, class: "rounded-md") %>
      <%= @b.(:year, options: [map_year_option(year)], value: year,  class: "hidden") %>
      """
    end
  end

  defp month_options(range) do
    Range.new(range.first.month, range.last.month)
    |> Enum.map(&{Timex.month_name(&1), &1})
  end

  defp map_year_option(year), do: {year, year}

  defp map_day_option(date), do: {Timex.format!(date, "{D} ({WDshort})"), date.day}
end
