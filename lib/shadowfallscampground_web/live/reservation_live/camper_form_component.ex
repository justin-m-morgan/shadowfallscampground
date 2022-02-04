defmodule ShadowfallscampgroundWeb.ReservationLive.CamperFormComponent do
  @moduledoc """
  Isolated live component for managing the state of the camper form
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Identities
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.{FormStepComponent}

  @doc "Display title for the form"
  prop title, :string, default: "Contact Details"

  @doc "Camper struct"
  prop camper, :map, required: true

  @doc "External changeset to prepopulate form"
  prop camper_changeset, :any

  @doc "Form changeset"
  data changeset, :map

  def render(assigns) do
    ~F"""
    <Forms.Form
      title={@title}
      changeset={@changeset}
      change="validate"
      submit="save"
      data_test="camper-form"
    >
      <Forms.TextInput name={:name} />

      <Forms.EmailInput name={:email} />

      <Forms.WizardButtonPairs show_back={false} valid={@changeset.valid?} />
    </Forms.Form>
    """
  end

  @impl true
  def update(%{camper: camper, camper_changeset: camper_changeset} = assigns, socket) do
    FormStepComponent.update(
      socket,
      assigns,
      camper,
      camper_changeset,
      &Identities.change_camper/1
    )
  end

  @impl true
  def handle_event("validate", %{"camper" => camper_params}, socket) do
    FormStepComponent.handle_validate_event(
      socket,
      :camper,
      camper_params,
      &Identities.change_camper/2
    )
  end

  def handle_event("save", _params, socket) do
    FormStepComponent.handle_save_event(socket, :camper_changeset, socket.assigns.changeset)
  end

  def handle_event("back", _params, socket) do
    {:noreply, socket}
  end
end
