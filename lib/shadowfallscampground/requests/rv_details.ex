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
    10..45//5
    |> Enum.map(&{:"#{&1}", rv_length_string_formatter(&1)})
  end

  def rv_length_string_formatter(10), do: "Under 15ft"
  def rv_length_string_formatter(45), do: "45ft or more"
  def rv_length_string_formatter(num), do: "#{num} - #{num + 4}ft"
end
