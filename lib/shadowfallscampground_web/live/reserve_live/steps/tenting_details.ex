defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.TentingDetails do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :number_of_tents, :integer
    field :power_requested, :boolean
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(tenting_details \\ %__MODULE__{}, attrs) do
    tenting_details
    |> cast(attrs, [:number_of_tents, :power_requested])
    |> validate_required([:number_of_tents, :power_requested])
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
          id="tenting_details_form"
          data_test="tenting_details_form"
          title="Tenting Site Details"
          changeset_fn={&Steps.TentingDetails.changeset/2}
          base_struct={@base_struct}
          changeset={@changeset}
        >
          <Forms.RadioInput
            name={:power_requested}
            label="Power On-Site? ($5 per night)"
            mappings={[true: "Yes", false: "No"]}
            display_icon={false}
          />
          <Forms.RadioInput
            name={:number_of_tents}
            mappings={1..4 |> Enum.map(&{:"#{&1}", &1})}
            display_icon={false}
            class="grid-cols-4"
          />
          <p class="max-w-sm">If you have more tents, please break your reservation into multiple bookings. Such a group will need multiple sites. We prefer not to have one person responsible for large bookings.</p>
        </Steps.StepHandler>
      </div>
      """
    end
  end
end
