defmodule ShadowfallscampgroundWeb.ReservationLive.TentFormComponent do
  @moduledoc """
  Isolated live component for managing the state of the Tent Details form.
  """

  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.{ReservationContainer, Wizard}

  @doc "Display title for the form"
  prop title, :string, default: "Details about your Tenting Request"

  @doc "TentDetails struct"
  prop tent_details, :map, required: true

  @doc "Action for form"
  prop action, :atom, values: [:new]

  @doc "Route to redirect to after form submission"
  prop return_to, :string, required: true

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
          Continue
        </Components.CallToAction>
      {/if}
    </Forms.Form>
    """
  end

  @impl true
  def update(%{tent_details: tent_details, tent_changeset: tent_changeset} = assigns, socket) do
    changeset = maybe_prepopulate(tent_details, tent_changeset)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  defp maybe_prepopulate(_tent_details, %Ecto.Changeset{} = changeset), do: changeset
  defp maybe_prepopulate(tent_details, nil), do: Requests.TentDetails.changeset(tent_details, %{})

  @impl true
  def handle_event("validate", %{"tent_details" => tent_details_params}, socket) do
    changeset =
      socket.assigns.tent_details
      |> Requests.TentDetails.changeset(tent_details_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", _, socket) do
    send_update(ReservationContainer,
      id: "reservation-container",
      tenting_details_changeset: socket.assigns.changeset
    )

    send_update(Wizard, id: "reservation-wizard", command: :forward_step)

    {:noreply, socket}
  end
end
