defmodule Shadowfallscampground.Requests.TentDetails do
  @moduledoc """
  Schema for Tenting Details
  """
  import Ecto.Changeset
  use Ecto.Schema

  embedded_schema do
    field :number_of_people, :integer
    field :number_of_tents, :integer
    field :power_requested, :boolean, default: false
  end

  @doc false
  def changeset(tent_details), do: changeset(tent_details, %{})

  def changeset(tent_details, attrs) do
    tent_details
    |> cast(attrs, [:number_of_people, :number_of_tents, :power_requested])
    |> validate_required([:number_of_people, :number_of_tents])
  end
end
