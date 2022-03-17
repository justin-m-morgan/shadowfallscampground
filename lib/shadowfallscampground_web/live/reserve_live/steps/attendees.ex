defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.Attendees do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :number_of_people, :integer, default: 0
    embeds_many :attendees, __MODULE__.Attendee
  end

  @doc false
  def changeset(attendees, attrs) do
    parsed_form_values = parse_array_form_values(attrs)

    attendees
    |> cast(attrs, [:number_of_people])
    |> put_embed(:attendees, parsed_form_values)
    |> tap(&IO.inspect/1)

    # |> put_embed(parsed_form_values)
  end

  defp parse_array_form_values(payload) do
    payload
    |> Map.delete("number_of_people")
    |> Enum.group_by(&group_people_fields/1)
    |> Map.values()
    |> Enum.map(fn [{_, legal_name}, {_, preferred_name}] ->
      %{legal_name: legal_name, preferred_name: preferred_name}
    end)

    # |> then(&Map.put(%{}, :attendees, &1))
  end

  # defp group_people_fields({"number_of_people", _value}), do: "number_of_people"

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
    use ShadowfallscampgroundWeb, :live_component

    alias ShadowfallscampgroundWeb.Forms
    alias ShadowfallscampgroundWeb.ReserveLive.Steps

    prop base_struct, :struct, required: true

    prop changeset, :map

    def render(assigns) do
      ~F"""
      <div>
        <Steps.StepHandler
          :let={changeset: changeset}
          id="attendees_form"
          data_test="attendees_form"
          title="Guest List"
          changeset_fn={&Steps.Attendees.changeset/2}
          base_struct={@base_struct}
        >
          <Forms.RadioInput
            name={:number_of_people}
            mappings={number_of_people_mappings()}
            display_icon={false}
            class="grid-cols-6"
          />

          {#if number_of_guests(changeset) > 0}
            {#for num <- number_of_people_generator(changeset)}
              <fieldset class="border-2 border-gray-300 py-2 px-3">
                <legend>Person {num + 1}</legend>
                <Forms.TextInput name={:"#{num}[legal_name]"} label="Legal Name" />
                <Forms.TextInput name={:"#{num}[preferred_name]"} label="Preferred Name (Optional)" />
              </fieldset>
            {/for}
          {/if}
        </Steps.StepHandler>
      </div>
      """
    end

    defp number_of_guests(changeset) do
      Ecto.Changeset.get_change(changeset, :number_of_people, 0)
    end

    defp number_of_people_mappings() do
      0..11
      |> Enum.map(&{:"#{&1}", "#{&1}"})
    end

    defp number_of_people_generator(changeset) do
      changeset
      |> number_of_guests()
      |> then(&Range.new(0, &1 - 1))
    end
  end
end
