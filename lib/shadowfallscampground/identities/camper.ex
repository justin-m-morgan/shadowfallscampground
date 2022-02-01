defmodule Shadowfallscampground.Identities.Camper do
  @moduledoc """
  Schema for Camper identies
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "campers" do
    field :email, :string
    field :name, :string

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
