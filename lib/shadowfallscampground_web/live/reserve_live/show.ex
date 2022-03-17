defmodule ShadowfallscampgroundWeb.ReservationLive.Show do
  use ShadowfallscampgroundWeb, :live_view

  alias Shadowfallscampground.Requests

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:reservation, Requests.get_reservation!(id))}
  end

  defp page_title(:show), do: "Show Reservation"
  defp page_title(:edit), do: "Edit Reservation"
end
