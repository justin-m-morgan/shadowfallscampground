defmodule Shadowfallscampground.Requests.Reservation do
  use Ecto.Schema
  import Ecto.Changeset

  alias Shadowfallscampground.Requests.{
    Attendees,
    ContactInfo,
    FinalRemarks,
    RvDetails,
    TentDetails
  }

  @arrival_time "16"
  @departure_time "11"

  schema "reservations" do
    field :arrival, :naive_datetime
    field :departure, :naive_datetime
    field :type_of_request, Ecto.Enum, values: [:rv, :tent]

    embeds_one(:contact_info, ContactInfo)
    embeds_one(:attendees, Attendees)
    embeds_one(:rv_details, RvDetails)
    embeds_one(:tent_details, TentDetails)
    embeds_one(:final_remarks, FinalRemarks)

    timestamps()
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(basic_details \\ %__MODULE__{}, attrs) do
    basic_details
    |> cast(add_times_to_dates(attrs), [:arrival, :departure, :type_of_request])
    |> maybe_bump_departure()
    |> validate_required([:arrival, :departure, :type_of_request])
    |> validate_departure_after_arrival()
  end

  def merge_changesets(changesets) do
    [
      contact_info: :contact_info_changeset,
      attendees: :attendees_changeset,
      rv_details: :rv_details_changeset,
      tent_details: :tent_details_changeset,
      final_remarks: :final_remarks_changeset
    ]
    |> Enum.reduce(changesets.basic_details_changeset, merge_embedded_changeset(changesets))
  end

  defp merge_embedded_changeset(changesets) do
    fn {embed_key, extraction_key}, changeset ->
      changeset
      |> put_embed(embed_key, Map.get(changesets, extraction_key))
    end
  end

  defp maybe_bump_departure(changeset) do
    arrival = get_field(changeset, :arrival)
    departure = get_change(changeset, :departure)
    one_day = Timex.Duration.from_days(1)

    cond do
      is_nil(arrival) ->
        changeset

      is_nil(departure) ->
        bump_date(changeset, arrival, one_day)

      not Timex.before?(arrival, departure) ->
        bump_date(changeset, arrival, one_day)

      true ->
        changeset
    end
  end

  defp bump_date(changeset, arrival, duration) do
    bumped_date =
      Timex.add(arrival, duration) |> Timex.set(hour: String.to_integer(@departure_time))

    put_change(changeset, :departure, bumped_date)
  end

  defp add_times_to_dates(params) do
    params
    |> Map.put("arrival", add_time_to_dates(params["arrival"], @arrival_time))
    |> Map.put("departure", add_time_to_dates(params["departure"], @departure_time))
  end

  defp add_time_to_dates(date_component, hour, minute \\ "0", second \\ "0")
  defp add_time_to_dates(nil, _hour, _minute, _second), do: nil

  defp add_time_to_dates(date_components, hour, minute, second) do
    date_components
    |> Map.put("hour", hour)
    |> Map.put("minute", minute)
    |> Map.put("second", second)
  end

  defp validate_departure_after_arrival(changeset) do
    arrival = get_change(changeset, :arrival)
    departure = get_change(changeset, :departure)

    case date_on_or_before(departure, arrival) do
      true -> add_error(changeset, :departure, "Departure must be after arrival")
      false -> changeset
    end
  end

  defp date_on_or_before(nil, _comparison), do: true
  defp date_on_or_before(date, comparison), do: not Timex.after?(date, comparison)

  defp config() do
    [
      start_of_season: date_env("SEASON_START"),
      end_of_season: date_env("SEASON_END")
    ]
  end

  defp date_env(key) do
    System.get_env(key) ||
      "2022-05-15"
      |> Timex.parse!("{YYYY}-{0M}-{0D}")
  end
end
