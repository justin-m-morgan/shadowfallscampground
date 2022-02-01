defmodule ShadowfallscampgroundWeb.ReservationLive.FormComponent do
  @moduledoc """
  An isolated LiveComponent for managing the state of the reservation form.
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms

  @doc "Display title for the form"
  prop title, :string, default: "Make a Reservation"

  @doc "Reservation struct"
  prop reservation, :map, required: true

  @doc "Action for form"
  prop action, :atom, values: [:new]

  @doc "Route to redirect to after form submission"
  prop return_to, :string, required: true

  @doc "Form changeset"
  data changeset, :map

  def render(assigns) do
    ~F"""
    <Forms.Form title="Reservation Basics" changeset={@changeset} change="validate" submit="save" data_test="reservation-form">
      <Surface.Components.Context get={Surface.Components.Form, form: form}>
        <Forms.DateRangeInput
          id="reservation-date-range-picker"
          form={form}
          start_date_field={:arrival}
          end_date_field={:departure}
          min_date={~D[2022-04-15]}
          max_date={~D[2022-09-15]}
          focused_start_date={update_focused_date(@changeset, :arrival)}
          focused_end_date={update_focused_date(@changeset, :departure)}
        />
      </Surface.Components.Context>

      <Forms.RadioInput
        name={:type_of_request}
        label="Type of Request"
        mappings={Ecto.Enum.mappings(Requests.Reservation, :type_of_request)}
      />

      {#if length(@changeset.errors) > 0}
        <Forms.ErrorSummary
          changeset={@changeset}
          error_key_list={[
            arrival: "Arrival",
            departure: "Departure",
            type_of_request: "Type of Request"
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
  def update(%{reservation: reservation} = assigns, socket) do
    changeset = Requests.change_reservation(reservation)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"reservation" => reservation_params}, socket) do
    changeset =
      socket.assigns.reservation
      |> Requests.change_reservation(reservation_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"reservation" => reservation_params}, socket) do
    save_reservation(socket, socket.assigns.action, reservation_params)
  end

  defp save_reservation(socket, :new, reservation_params) do
    case Requests.create_reservation(reservation_params) do
      {:ok, _reservation} ->
        {:noreply,
         socket
         |> put_flash(:info, "Reservation created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp update_focused_date(changeset, key) do
    Ecto.Changeset.get_change(changeset, key)
  end
end
