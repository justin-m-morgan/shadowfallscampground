defmodule Shadowfallscampground.Identities.Camper do
  @moduledoc """
  Schema for Camper identies
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Shadowfallscampground.Requests.Reservation

  schema "campers" do
    field :email, :string
    field :name, :string

    has_many :bookings, Reservation, foreign_key: :booker_id
    many_to_many :trips, Camper, join_through: "reservation_campers"

    timestamps()
  end

  @doc false
  def changeset(camper, attrs) do
    camper
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/^\S+@\S+\.\S+$/, message: "Invalid email format")
  end
end
