defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.ContactInfo do
  @moduledoc """
  Form component for providing contact info
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop changeset, :struct, required: true

  def render(assigns) do
    ~F"""
    <div>
      <Steps.StepHandler
        id="contact_info_form"
        data_test="contact_info_form"
        title="Contact Info"
        changeset={@changeset}
      >
        <Forms.TextInput name={:legal_name} />
        <Forms.TextInput name={:preferred_name} label="Prerred Name (Optional)" />
        <Forms.EmailInput name={:email} />
      </Steps.StepHandler>
    </div>
    """
  end
end
