defmodule ShadowfallscampgroundWeb.PageLive do
  @moduledoc """
  LiveView for static pages
  """
  use ShadowfallscampgroundWeb, :live_view

  alias Shadowfallscampground.Inquiries.Inquiry
  alias ShadowfallscampgroundWeb.Pages

  @impl true
  def render(assigns) do
    ~F"""
    <div>
      {#if @live_action in [:inquiry]}
        <.modal return_to={Routes.page_path(@socket, :index)}>
          <.live_component
            module={ShadowfallscampgroundWeb.InquiryLive.FormComponent}
            id={@inquiry.id || :new}
            title={@page_title}
            action={@live_action}
            inquiry={@inquiry}
            return_to={Routes.page_path(@socket, :index)}
          />
        </.modal>
      {/if}
      <Pages.Index />
    </div>
    """
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :inquiry, _params) do
    socket
    |> assign(:page_title, "General Inquiry")
    |> assign(:inquiry, %Inquiry{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Welcome")
    |> assign(:inquiry, nil)
  end
end
