defmodule ShadowfallscampgroundWeb.CamperLive.FormComponent do
  @moduledoc """
  Isolated live component for managing the state of the camper form
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Identities
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.ReservationContainer

  @doc "Display title for the form"
  prop title, :string, default: "Contact Details"

  @doc "Camper struct"
  prop camper, :map, required: true

  @doc "Action for form"
  prop action, :atom, values: [:new]

  @doc "Route to redirect to after form submission"
  prop return_to, :string, required: true

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

      {#if length(@changeset.errors) > 0}
        <Forms.ErrorSummary
          changeset={@changeset}
          error_key_list={[
            name: "Name",
            email: "Email"
          ]}
        />
      {#else}
        <Components.CallToAction type="submit" opts={phx_disable_with: "Saving..."}>
          Submit Request
        </Components.CallToAction>
      {/if}
    </Forms.Form>
    """
  end

  @impl true
  def update(%{camper: camper} = assigns, socket) do
    changeset = Identities.change_camper(camper)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"camper" => camper_params}, socket) do
    changeset =
      socket.assigns.camper
      |> Identities.change_camper(camper_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"camper" => camper_params}, socket) do
    save_camper(socket, socket.assigns.action, camper_params)
  end

  defp save_camper(socket, :new, _camper_params) do
    send_update(ReservationContainer,
      id: "reservation-container",
      camper_changeset: socket.assigns.changeset
    )

    {:noreply, socket}
  end
end
