defmodule Shadowfallscampground.Requests.TentDetails do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :number_of_tents, :integer
    field :power_requested, :boolean

    timestamps()
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(tenting_details \\ %__MODULE__{}, attrs) do
    tenting_details
    |> cast(attrs, [:number_of_tents, :power_requested])
    |> validate_required([:number_of_tents, :power_requested])
  end
end
