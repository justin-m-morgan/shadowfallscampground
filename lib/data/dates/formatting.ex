defmodule Shadowfallscampground.Data.Dates.Formatting do
  @moduledoc """
  Date string formatting utilities
  """

  def pretty_date(date, format \\ :short)

  def pretty_date(date, :short) do
    Timex.format!(date, "{Mshort} {D}")
  end

  def pretty_date(date, :short_w_day_of_week) do
    Timex.format!(date, "{Mshort} {D} ({WDfull})")
  end

  def duration({start_date, end_date}) do
    Timex.diff(start_date, end_date, :days)
  end
end
