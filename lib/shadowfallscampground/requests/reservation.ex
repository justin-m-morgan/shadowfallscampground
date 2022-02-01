defmodule Shadowfallscampground.Requests.Reservation do
  @moduledoc """
  The reservation schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias Shadowfallscampground.Requests.{TentDetails, RvDetails}

  schema "reservations" do
    field :arrival, :date
    field :departure, :date
    field :type_of_request, Ecto.Enum, values: [:tenting, :rv]
    embeds_one :rv_details, RvDetails
    embeds_one :tent_details, TentDetails

    timestamps()
  end

  @doc false
  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:arrival, :departure, :type_of_request])
    |> validate_required([:arrival, :departure, :type_of_request])
    |> maybe_bump_arrival()
    |> validate_departure_after_arrival()
    |> validate_type_of_request()
    |> cast_details()
  end


  defp cast_details(%{changes: %{type_of_request: :tenting}} = changeset) do
    cast_embed(changeset, :tent_details)
  end
  defp cast_details(%{changes: %{type_of_request: :rv}} = changeset) do
    cast_embed(changeset, :rv_details)
  end
  defp cast_details(changeset), do: changeset

  defp validate_type_of_request(changeset) do
    type_of_request_values = Ecto.Enum.values(__MODULE__, :type_of_request)
    validate_inclusion(changeset, :type_of_request, type_of_request_values)
  end

  defp validate_departure_after_arrival(changeset) do
    departure = get_change(changeset, :departure)
    arrival = get_change(changeset, :arrival)

    if is_map(arrival) and is_map(departure) do
      validate_change(changeset, :departure, fn :departure, _departure ->
        case Timex.after?(departure, arrival) do
          true ->
            []

          false ->
            [departure: "departure must be after arrival"]
        end
      end)
    else
      changeset
    end
  end

  defp maybe_bump_arrival(changeset) do
    arrival = get_change(changeset, :arrival)
    departure = get_change(changeset, :departure)

    cond do
      is_nil(arrival) or is_nil(departure) -> changeset
      Timex.before?(departure, arrival) -> put_change(changeset, :departure, Date.add(arrival, 1))
      true -> changeset
    end
  end
end
