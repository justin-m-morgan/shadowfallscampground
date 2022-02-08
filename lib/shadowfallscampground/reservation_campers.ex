defmodule Shadowfallscampground.ReservationCampers do
  @moduledoc """
  Join table between Reservations and Campers
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Shadowfallscampground.Identities.Camper
  alias Shadowfallscampground.Requests.Reservation

  schema "guests" do
    belongs_to :reservation, Reservation
    belongs_to :camper, Camper

    timestamps()
  end

  @doc false
  def changeset(guests, attrs) do
    guests
    |> cast(attrs, [])
    |> validate_required([])
  end
end
