defmodule Shadowfallscampground.Requests.FinalRemarks do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :remarks, :string

    timestamps()
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(final_remarks \\ %__MODULE__{}, attrs) do
    final_remarks
    |> cast(attrs, [:remarks])
  end
end
