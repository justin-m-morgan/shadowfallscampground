defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.FinalRemarks do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :remarks, :string
  end

  @doc false
  def changeset(contact_info, attrs) do
    contact_info
    |> cast(attrs, [:remarks])
    |> validate_required([])
  end

  defmodule FormComponent do
    @moduledoc """
    Form component for final remarks
    """
    use ShadowfallscampgroundWeb, :component

    alias ShadowfallscampgroundWeb.Forms
    alias ShadowfallscampgroundWeb.ReserveLive.Steps

    prop base_struct, :struct, required: true

    def render(assigns) do
      ~F"""
      <div>
        <Steps.StepHandler
          id="final_remarks_form"
          data_test="final_remarks_form"
          title="Questions/Comments"
          changeset_fn={&Steps.FinalRemarks.changeset/2}
          base_struct={@base_struct}
        >
          <Forms.TextArea name={:remarks} label="Message" />
        </Steps.StepHandler>
      </div>
      """
    end
  end
end
