defmodule ShadowfallscampgroundWeb.ReservationLive.RvFormComponent do
  @moduledoc """
  Isolated live component for rv details form
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.ReservationContainer

  @doc "Display title for the form"
  prop title, :string, default: "Details about your Rving Request"

  @doc "RvDetails struct"
  prop rv_details, :map, required: true

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
      data_test="rv-details-form"
    >
      <Forms.RadioInput label="Type of Unit" name={:type_of_unit} schema_module={Requests.RvDetails} />

      <Forms.NumberInput name={:length_of_unit} />

      <Forms.NumberInput name={:number_of_people} />

      {#if length(@changeset.errors) > 0}
        <Forms.ErrorSummary
          changeset={@changeset}
          error_key_list={[
            number_of_people: "Number of People",
            length_of_unit: "Length of Unit",
            type_of_unit: "Type of Unit"
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
  def update(%{rv_details: rv_details} = assigns, socket) do
    changeset = Requests.RvDetails.changeset(rv_details, %{})

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"rv_details" => rv_details_params}, socket) do
    changeset =
      socket.assigns.rv_details
      |> Requests.RvDetails.changeset(rv_details_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", _, socket) do
    send_update(ReservationContainer,
      id: "reservation-container",
      rv_details_changeset: socket.assigns.changeset
    )

    {:noreply, socket}
  end
end
