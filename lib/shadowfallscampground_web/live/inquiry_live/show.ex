defmodule ShadowfallscampgroundWeb.InquiryLive.Show do
  use ShadowfallscampgroundWeb, :live_view

  alias Shadowfallscampground.Inquiries

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:inquiry, Inquiries.get_inquiry!(id))}
  end

  defp page_title(:show), do: "Show Inquiry"
  defp page_title(:edit), do: "Edit Inquiry"
end
