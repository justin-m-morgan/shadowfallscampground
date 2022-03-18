defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.RvDetails do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :type_of_unit, Ecto.Enum, values: [:rv, :trailer, :fifth_wheel]
    field :length_of_unit, :integer
    field :sewer_required, :boolean, default: true
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

  defmodule FormComponent do
    @moduledoc """
    Form component for step one
    """
    use ShadowfallscampgroundWeb, :component

    alias ShadowfallscampgroundWeb.Forms
    alias ShadowfallscampgroundWeb.ReserveLive.Steps

    prop base_struct, :struct, required: true

    prop changeset, :struct, required: true

    def render(assigns) do
      ~F"""
      <div>
        <Steps.StepHandler
          id="rv_details_form"
          data_test="rv_details_form"
          title="RV Site Details"
          changeset_fn={&Steps.RvDetails.changeset/2}
          base_struct={@base_struct}
          changeset={@changeset}
        >
          <Forms.RadioInput
            name={:type_of_unit}
            label="Type of Unit"
            schema_module={Steps.RvDetails}
            class="grid-cols-3"
          />
          <Forms.RadioInput
            name={:length_of_unit}
            mappings={Steps.RvDetails.rv_lengths()}
            display_icon={false}
          />
          <Forms.RadioInput
            name={:sewer_required}
            label="Sewer Hookup Required?"
            mappings={[true: "Yes", false: "No"]}
            display_icon={false}
          />
        </Steps.StepHandler>
      </div>
      """
    end
  end
end
