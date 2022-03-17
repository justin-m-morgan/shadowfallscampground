defmodule ShadowfallscampgroundWeb.ReserveLive.FormComponent do
  @moduledoc """
  Form component for saving/editing reservation requests
  """
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias ShadowfallscampgroundWeb.Forms

  prop reservation, :struct, required: true

  data changeset, :struct

  def render(assigns) do
    ~F"""
    <div>
      <Forms.Form
        changeset={@changeset}
        change="validate"
        submit="save"
        title="Make a Reservation"
        data_test="reservation_form"
      >
        <Forms.DateRangeInput
          id="reservation_date_range_input"
          form={:reservation}
          start_date_field={:arrival}
          end_date_field={:departure}
          min_date={~D[2022-05-15]}
          max_date={~D[2022-09-15]}
          focused_start_date={@changeset.changes[:arrival]}
          focused_end_date={@changeset.changes[:departure]}
          year={2022}
        />
        <Forms.RadioInput
          name={:type_of_request}
          label="Type of Request"
          schema_module={Requests.Reservation}
        />
      </Forms.Form>
    </div>
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
    # reservation_params = add_times_to_dates(reservation_params)

    changeset =
      socket.assigns.reservation
      |> Requests.change_reservation(reservation_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"reservation" => reservation_params}, socket) do
    save_reservation(socket, :new, reservation_params)
  end

  # defp save_reservation(socket, :edit, reservation_params) do
  #   case Requests.update_reservation(socket.assigns.reservation, reservation_params) do
  #     {:ok, _reservation} ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:info, "Reservation updated successfully")
  #        |> push_redirect(to: socket.assigns.return_to)}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, :changeset, changeset)}
  #   end
  # end

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
end
