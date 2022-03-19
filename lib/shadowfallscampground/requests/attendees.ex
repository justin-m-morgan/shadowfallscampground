defmodule Shadowfallscampground.Requests.Attendees do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :number_of_people, :integer, default: 0
    embeds_many :attendees, __MODULE__.Attendee

    timestamps()
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(attendees \\ %__MODULE__{}, attrs) do
    parsed_form_values = parse_array_form_values(attrs)

    attendees
    |> cast(attrs, [:number_of_people])
    |> put_embed(:attendees, parsed_form_values)
  end

  defp parse_array_form_values(payload) do
    payload
    |> Map.delete("number_of_people")
    |> Enum.group_by(&group_people_fields/1)
    |> Map.values()
    |> Enum.map(fn [{_, legal_name}, {_, preferred_name}] ->
      %{legal_name: legal_name, preferred_name: preferred_name}
    end)
  end

  defp group_people_fields({key, _value}) do
    case String.split(key, ["[", "]"], trim: true) do
      [num, "legal_name"] -> num
      [num, "preferred_name"] -> num
    end
  end

  defmodule Attendee do
    use Ecto.Schema
    import Ecto.Changeset

    embedded_schema do
      field :legal_name, :string
      field :preferred_name, :string

      timestamps()
    end

    @doc false
    def changeset(attendee \\ %__MODULE__{}, attrs) do
      attendee
      |> cast(attrs, [:legal_name, :preferred_name])
      |> validate_required([:legal_name])
    end
  end
end
