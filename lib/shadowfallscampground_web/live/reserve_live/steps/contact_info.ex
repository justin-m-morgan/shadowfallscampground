defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.ContactInfo do
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
  def changeset(contact_info, attrs) do
    contact_info
    |> cast(attrs, [:legal_name, :preferred_name, :email])
    |> validate_required([:legal_name, :email])
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
          id="contact_info_form"
          data_test="contact_info_form"
          title="Contact Info"
          changeset_fn={&Steps.ContactInfo.changeset/2}
          base_struct={@base_struct}
        >
          <Forms.TextInput name={:legal_name} />
          <Forms.TextInput name={:preferred_name} label="Prerred Name (Optional)" />
          <Forms.EmailInput name={:email} />
        </Steps.StepHandler>
      </div>
      """
    end
  end
end
