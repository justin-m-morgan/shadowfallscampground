defmodule Shadowfallscampground.Requests.RvDetails do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :type_of_unit, Ecto.Enum, values: [:rv, :trailer, :fifth_wheel]
    field :length_of_unit, :integer
    field :sewer_required, :boolean, default: true

    timestamps()
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(rv_details \\ %__MODULE__{}, attrs) do
    rv_details
    |> cast(attrs, [:type_of_unit, :length_of_unit, :sewer_required])
    |> validate_required([:type_of_unit, :length_of_unit])
  end

  def rv_lengths() do
    15..40//5
    |> Enum.map(&{:"#{&1}", "#{&1} - #{&1 + 4}ft"})
    |> then(&[{:"10", "Under 15ft"} | &1])
    |> then(&(&1 ++ [{:"45", "45ft or more"}]))
  end
end
