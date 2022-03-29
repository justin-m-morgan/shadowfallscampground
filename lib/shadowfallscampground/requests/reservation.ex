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
    IO.inspect(attrs)

    basic_details
    |> cast(add_times_to_dates(attrs), [:arrival, :departure, :type_of_request])
    |> maybe_add_default_dates(:arrival, "SEASON_START", "2022-05-15")
    |> maybe_add_default_dates(:departure, "SEASON_START", "2022-05-15", 1)
    |> cast_embed(:contact_info)
    |> maybe_cast_embed(:attendees, attrs)
    |> maybe_cast_embed(:final_remarks, attrs)
    |> maybe_embed_site_details()
    |> maybe_bump_departure()
    |> validate_departure_after_arrival()
  end

  defp maybe_cast_embed(changeset, key, attrs) do
    cond do
      Ecto.Changeset.get_change(changeset, key) -> cast_embed(changeset, key)
      Map.get(attrs, Atom.to_string(key)) -> cast_embed(changeset, key)
      true -> changeset
    end
  end

  defp maybe_embed_site_details(changeset) do
    case Ecto.Changeset.get_field(changeset, :type_of_request) do
      :tent -> cast_embed(changeset, :tent_details)
      :rv -> cast_embed(changeset, :rv_details)
      _ -> changeset
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
    arrival = get_field(changeset, :arrival)
    departure = get_field(changeset, :departure)

    case date_on_or_before(departure, arrival) do
      true -> add_error(changeset, :departure, "Departure must be after arrival")
      false -> changeset
    end
  end

  defp date_on_or_before(nil, _comparison), do: true
  defp date_on_or_before(date, comparison), do: not Timex.after?(date, comparison)

  def config() do
    [
      start_of_season: date_env("SEASON_START"),
      end_of_season: date_env("SEASON_END")
    ]
  end

  defp maybe_add_default_dates(changeset, key, sys_key, default, shift_days \\ 0) do
    case get_field(changeset, key, nil) do
      nil -> put_change(changeset, key, date_env(sys_key, default, shift_days))
      _ -> changeset
    end
  end

  defp date_env(key, default \\ "2022-05-15", shift_days \\ 0) do
    System.get_env(key, default)
    |> Timex.parse!("{YYYY}-{0M}-{0D}")
    |> Timex.add(Timex.Duration.from_days(shift_days))
  end

  def coerce_reservation_to_map(%__MODULE__{} = reservation) do
    attendees = struct_to_map(reservation.attendees)
    attendees = Map.put(attendees, :attendees, Enum.map(attendees.attendees, &struct_to_map/1))

    reservation
    |> struct_to_map()
    |> Map.put(:contact_info, struct_to_map(reservation.contact_info))
    |> Map.put(:attendees, attendees)
    |> Map.put(:rv_details, struct_to_map(reservation.rv_details))
    |> Map.put(:tent_details, struct_to_map(reservation.tent_details))
    |> Map.put(:final_remarks, struct_to_map(reservation.final_remarks))
  end

  defp struct_to_map(nil), do: nil

  defp struct_to_map(struct) when is_struct(struct) do
    struct
    |> Map.from_struct()
    |> Map.drop([:__meta__, :inserted_at, :updated_at])
  end
end
