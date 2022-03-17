defmodule ShadowfallscampgroundWeb.ReservationLive.Index do
  use ShadowfallscampgroundWeb, :live_view

  alias Shadowfallscampground.Requests
  alias Shadowfallscampground.Requests.Reservation

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :reservations, list_reservations())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Reservation")
    |> assign(:reservation, Requests.get_reservation!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Reservation")
    |> assign(:reservation, %Reservation{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Reservations")
    |> assign(:reservation, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    reservation = Requests.get_reservation!(id)
    {:ok, _} = Requests.delete_reservation(reservation)

    {:noreply, assign(socket, :reservations, list_reservations())}
  end

  defp list_reservations do
    Requests.list_reservations()
  end
end
