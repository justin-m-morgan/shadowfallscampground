defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.Attendees do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    embeds_many :attendees, __MODULE__.Attendee
  end

  @doc false
  def changeset(attendees, attrs) do
    parsed_form_values = parse_array_form_values(attrs)
    IO.inspect(parsed_form_values, label: "Parsed")

    attendees
    |> cast(attrs, [])
    |> put_embed(:attendees, parsed_form_values)
    |> tap(&IO.inspect/1)

    # |> put_embed(parsed_form_values)
  end

  defp parse_array_form_values(payload) do
    payload
    |> Enum.group_by(fn {key, _} ->
      case String.split(key, ["[", "]"], trim: true) do
        [num, "legal_name"] -> num
        [num, "preferred_name"] -> num
      end
    end)
    |> Map.values()
    |> Enum.map(fn [{_, legal_name}, {_, preferred_name}] ->
      %{legal_name: legal_name, preferred_name: preferred_name}
    end)

    # |> then(&Map.put(%{}, :attendees, &1))
  end

  defmodule Attendee do
    use Ecto.Schema
    import Ecto.Changeset

    embedded_schema do
      field :legal_name, :string
      field :preferred_name, :string
    end

    @doc false
    def changeset(attendee \\ %__MODULE__{}, attrs) do
      attendee
      |> cast(attrs, [:legal_name, :preferred_name])
      |> validate_required([:legal_name])
    end
  end

  defmodule FormComponent do
    @moduledoc """
    Form component for step one
    """
    use ShadowfallscampgroundWeb, :component

    alias ShadowfallscampgroundWeb.Forms
    alias ShadowfallscampgroundWeb.ReserveLive.Steps

    prop base_struct, :struct, required: true

    def render(assigns) do
      ~F"""
      <div>
        <Steps.StepHandler
          id="attendees_form"
          data_test="attendees_form"
          title="Guest List"
          changeset_fn={&Steps.Attendees.changeset/2}
          base_struct={@base_struct}
        >
          {#for num <- 0..4}
            <fieldset class="border-2 border-gray-300 py-2 px-3">
              <legend>Person {num + 1}</legend>
              <Forms.TextInput name={:"#{num}[legal_name]"} label="Legal Name" />
              <Forms.TextInput name={:"#{num}[preferred_name]"} label="Preferred Name (Optional)" />
            </fieldset>
          {/for}
        </Steps.StepHandler>
      </div>
      """
    end
  end
end
