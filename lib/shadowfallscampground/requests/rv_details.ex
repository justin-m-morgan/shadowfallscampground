defmodule Shadowfallscampground.Requests.RvDetails do
  @moduledoc """
  Schema for RV Details
  """
  use Ecto.Schema

  import Ecto.Changeset

  embedded_schema do
    field :number_of_people, :integer
    field :length_of_unit, :integer
    field :type_of_unit, Ecto.Enum, values: [:rv, :trailer, :fifth_wheel]
    field :sewer_required, :boolean, default: false
  end

  @doc false
  def changeset(rv_details, attrs) do
    rv_details
    |> cast(attrs, [:number_of_people, :length_of_unit, :type_of_unit, :sewer_required])
    |> validate_required([:number_of_people, :length_of_unit, :type_of_unit])
  end
end
