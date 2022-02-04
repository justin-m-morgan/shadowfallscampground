defmodule ShadowfallscampgroundWeb.ReservationLive.RvFormComponent do
  @moduledoc """
  Isolated live component for rv details form
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.FormStepComponent

  @doc "Display title for the form"
  prop title, :string, default: "Details about your Rving Request"

  @doc "RvDetails struct"
  prop rv_details, :map, required: true

  @doc "External changeset to prepopulate form"
  prop rv_changeset, :any

  @doc "Form changeset"
  data changeset, :map

  def render(assigns) do
    ~F"""
    <Forms.Form
      title={@title}
      changeset={@changeset}
      change="validate"
      submit="save"
      data_test="rv-details-form"
    >
      <Forms.RadioInput label="Type of Unit" name={:type_of_unit} schema_module={Requests.RvDetails} />

      <Forms.NumberInput name={:length_of_unit} />

      <Forms.NumberInput name={:number_of_people} />

      <Forms.WizardButtonPairs back_action="back" valid={@changeset.valid?} />
    </Forms.Form>
    """
  end

  @impl true
  def update(%{rv_details: rv_details, rv_changeset: rv_changeset} = assigns, socket) do
    FormStepComponent.update(
      socket,
      assigns,
      rv_details,
      rv_changeset,
      &Requests.RvDetails.changeset/1
    )
  end

  @impl true
  def handle_event("validate", %{"rv_details" => rv_details_params}, socket) do
    FormStepComponent.handle_validate_event(
      socket,
      :rv_details,
      rv_details_params,
      &Requests.RvDetails.changeset/2
    )
  end

  def handle_event("save", _, socket) do
    FormStepComponent.handle_save_event(socket, :rv_details_changeset, socket.assigns.changeset)
  end

  def handle_event("back", _params, socket) do
    FormStepComponent.handle_back_event(socket)
  end
end
