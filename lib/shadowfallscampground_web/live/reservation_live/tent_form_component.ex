defmodule ShadowfallscampgroundWeb.ReservationLive.TentFormComponent do
  @moduledoc """
  Isolated live component for managing the state of the Tent Details form.
  """

  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.FormStepComponent

  @doc "Display title for the form"
  prop title, :string, default: "Details about your Tenting Request"

  @doc "TentDetails struct"
  prop tent_details, :map, required: true

  @doc "External changeset to prepopulate form"
  prop tent_changeset, :any

  @doc "Form changeset"
  data changeset, :map

  def render(assigns) do
    ~F"""
    <Forms.Form
      title={@title}
      changeset={@changeset}
      change="validate"
      submit="save"
      data_test="tent-details-form"
    >
      <Forms.NumberInput name={:number_of_people} />
      <Forms.NumberInput name={:number_of_tents} />

      <Forms.WizardButtonPairs back_action="back" valid={@changeset.valid?} />
    </Forms.Form>
    """
  end

  @impl true
  def update(%{tent_details: tent_details, tent_changeset: tent_changeset} = assigns, socket) do
    FormStepComponent.update(
      socket,
      assigns,
      tent_details,
      tent_changeset,
      &Requests.TentDetails.changeset/1
    )
  end

  @impl true
  def handle_event("validate", %{"tent_details" => tent_details_params}, socket) do
    FormStepComponent.handle_validate_event(
      socket,
      :tent_details,
      tent_details_params,
      &Requests.TentDetails.changeset/2
    )
  end

  def handle_event("save", _, socket) do
    FormStepComponent.handle_save_event(
      socket,
      :tent_details_changeset,
      socket.assigns.changeset
    )
  end

  def handle_event("back", _params, socket) do
    FormStepComponent.handle_back_event(socket)
  end
end
