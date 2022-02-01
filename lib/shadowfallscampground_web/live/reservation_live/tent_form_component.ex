defmodule ShadowfallscampgroundWeb.ReservationLive.TentFormComponent do
  @moduledoc """
  Isolated live component for managing the state of the Tent Details form.
  """

  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms

  @doc "Display title for the form"
  prop title, :string, default: "Details about your Tenting Request"

  @doc "TentDetails struct"
  prop tent_details, :map, required: true

  @doc "Action for form"
  prop action, :atom, values: [:new]

  @doc "Route to redirect to after form submission"
  prop return_to, :string, required: true

  @doc "Form changeset"
  data changeset, :map

  def render(assigns) do
    ~F"""
    <Forms.Form title={@title} changeset={@changeset} change="validate" submit="save" data_test="tent-details-form">

      <Forms.NumberInput name={:number_of_people} />
      <Forms.NumberInput name={:number_of_tents} />

      {#if length(@changeset.errors) > 0}
        <Forms.ErrorSummary
          changeset={@changeset}
          error_key_list={[
            number_of_people: "Number of People",
            number_of_tents: "Number of Tents"
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
  def update(%{tent_details: tent_details} = assigns, socket) do
    changeset = Requests.TentDetails.changeset(tent_details, %{})

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"tent_details" => tent_details_params}, socket) do
    changeset =
      socket.assigns.tent_details
      |> Requests.TentDetails.changeset(tent_details_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", _, socket) do
    {:noreply, socket}
  end

end
