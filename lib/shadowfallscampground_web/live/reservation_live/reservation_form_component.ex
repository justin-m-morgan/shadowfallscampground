defmodule ShadowfallscampgroundWeb.ReservationLive.ReservationFormComponent do
  @moduledoc """
  An isolated LiveComponent for managing the basic details portion of the reservation form.
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReservationLive.{FormStepComponent, ReservationContainer, Wizard}

  @doc "Display title for the form"
  prop title, :string, default: "Make a Reservation"

  @doc "Reservation struct"
  prop reservation, :map, required: true

  @doc "External changeset to prepopulate form"
  prop reservation_changeset, :any

  @doc "Form changeset"
  data changeset, :map

  def render(assigns) do
    ~F"""
    <Forms.Form
      title="Reservation Basics"
      changeset={@changeset}
      change="validate"
      submit="save"
      data_test="reservation-form"
    >
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
        schema_module={Requests.Reservation}
      />

      <Forms.WizardButtonPairs back_action="back" valid={@changeset.valid?} />
    </Forms.Form>
    """
  end

  @impl true
  def update(
        %{reservation: reservation, reservation_changeset: reservation_changeset} = assigns,
        socket
      ) do
    FormStepComponent.update(
      socket,
      assigns,
      reservation,
      reservation_changeset,
      &Requests.change_reservation/1
    )

    # changeset = maybe_prepopulate(reservation, reservation_changeset)

    # {:ok,
    #  socket
    #  |> assign(assigns)
    #  |> assign(:changeset, changeset)}
  end

  # defp maybe_prepopulate(_, %Ecto.Changeset{} = changeset), do: changeset
  # defp maybe_prepopulate(reservation, nil), do: Requests.change_reservation(reservation)

  @impl true
  def handle_event("validate", %{"reservation" => reservation_params}, socket) do
    FormStepComponent.handle_validate_event(
      socket,
      :reservation,
      reservation_params,
      &Requests.change_reservation/2
    )
  end

  def handle_event("save", _params, socket) do
    FormStepComponent.handle_save_event(socket, :reservation_changeset, socket.assigns.changeset)
  end

  def handle_event("back", _params, socket) do
    FormStepComponent.handle_back_event(socket)
  end

  defp update_focused_date(changeset, key) do
    Ecto.Changeset.get_change(changeset, key)
  end
end
