defmodule ShadowfallscampgroundEmail.EmailsView.Utilities do
  alias Shadowfallscampground.Requests.RvDetails
  alias Shadowfallscampground.Data.Dates

  def display_legal_and_preferred_name(person_details, format \\ :legal_first) do
    legal_name = maybe_extract_name(person_details, "legal_name")
    preferred_name = maybe_extract_name(person_details, "preferred_name")

    if preferred_name do
      case format do
        :legal_first -> "#{legal_name} (preferred: #{preferred_name})"
        :preferred_first -> "#{preferred_name} (legal: #{legal_name})"
      end
    else
      legal_name
    end
  end

  defp maybe_extract_name(params, key) do
    case params[key] do
      "" -> nil
      name -> name
    end
  end

  def humanize_form_values(value) do
    case value do
      "tent" -> "Tenting"
      "rv" -> "RV"
      "fifth_wheel" -> "Fifth-Wheel"
      "trailer" -> "Trailer"
      "true" -> "Yes"
      "false" -> "No"
      true -> "Yes"
      false -> "No"
      _ -> "No Value Provided"
    end
  end

  def parse_and_pretty_date(nil), do: "Date Not Provided"

  def parse_and_pretty_date(date_string) do
    date_string
    |> String.split("T")
    |> List.first()
    |> Timex.parse!("{YYYY}-{0M}-{D}")
    |> Dates.Formatting.pretty_date(:short_w_day_of_week)
  end

  def length_of_rv_formatter(value) when is_integer(value),
    do: RvDetails.rv_length_string_formatter(value)

  def length_of_rv_formatter(string_integer) do
    case Integer.parse(string_integer) do
      :error -> "Not a valid length"
      {integer, _} -> RvDetails.rv_length_string_formatter(integer)
    end
  end
end
