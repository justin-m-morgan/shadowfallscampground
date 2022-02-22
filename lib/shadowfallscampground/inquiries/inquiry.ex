defmodule Shadowfallscampground.Inquiries.Inquiry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inquiries" do
    field :email, :string
    field :message, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(inquiry, attrs) do
    inquiry
    |> cast(attrs, [:name, :email, :message])
    |> validate_required([:name, :email, :message])
  end
end
