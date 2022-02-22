defmodule ShadowfallscampgroundWeb.InquiryLive.Index do
  use ShadowfallscampgroundWeb, :live_view

  alias Shadowfallscampground.Inquiries
  alias Shadowfallscampground.Inquiries.Inquiry

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :inquiries, list_inquiries())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Inquiry")
    |> assign(:inquiry, Inquiries.get_inquiry!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "General Inquiry")
    |> assign(:inquiry, %Inquiry{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Inquiries")
    |> assign(:inquiry, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    inquiry = Inquiries.get_inquiry!(id)
    {:ok, _} = Inquiries.delete_inquiry(inquiry)

    {:noreply, assign(socket, :inquiries, list_inquiries())}
  end

  defp list_inquiries do
    Inquiries.list_inquiries()
  end
end
