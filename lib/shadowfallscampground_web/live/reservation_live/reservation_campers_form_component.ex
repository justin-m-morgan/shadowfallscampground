defmodule ShadowfallscampgroundWeb.ReservationLive.ReservationCampersFormComponent do
  @moduledoc """
  Isolated live component for registering the multiple camper names for a reservation
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests.Reservation
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.{FormStepComponent}

  @doc "Display title for the form"
  prop title, :string, default: "Guest List"

  @doc "Camper struct"
  prop camper, :map, required: true

  @doc "Changeset to update with camper associations"
  prop reservation_changeset, :any

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
      data_test="reservation-campers-form"
    >
      <Forms.TextInput name={:legal_name} />

      <Forms.WizardButtonPairs show_back={false} valid={@changeset.valid?} />
    </Forms.Form>
    """
  end

  @impl true
  def update(%{camper: camper} = assigns, socket) do
    FormStepComponent.update(
      socket,
      assigns,
      camper,
      nil,
      &Reservation.Campers.changeset/2
    )
  end

  @impl true
  def handle_event("validate", %{"campers" => camper_params}, socket) do
    FormStepComponent.handle_validate_event(
      socket,
      :camper,
      camper_params,
      &Reservation.Campers.changeset/2
    )
  end

  def handle_event("save", _params, socket) do
    FormStepComponent.handle_save_event(
      socket,
      :reservation_changeset,
      Reservation.put_camper_changeset(
        socket.assigns.reservation_changeset,
        socket.assigns.changeset.changes
      )
    )
  end

  def handle_event("back", _params, socket) do
    {:noreply, socket}
  end
end
