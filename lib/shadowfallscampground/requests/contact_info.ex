defmodule Shadowfallscampground.Requests.ContactInfo do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :legal_name, :string
    field :preferred_name, :string
    field :email, :string
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(contact_info \\ %__MODULE__{}, attrs) do
    contact_info
    |> cast(attrs, [:legal_name, :preferred_name, :email])
    |> validate_required([:legal_name, :email])
  end
end
