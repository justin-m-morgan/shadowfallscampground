defmodule ShadowfallscampgroundWeb.ReserveLive do
  @moduledoc """
  LiveView for static pages
  """
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Endpoint

  alias Shadowfallscampground.Requests.Reservation

  alias ShadowfallscampgroundWeb.ReserveLive.{
    DateWindowListing,
    LotteryDefinition,
    Steps
  }

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Reserve")
    |> assign(:reservation, %Reservation{})
  end

  @impl true
  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <div class="bg-trees min-h-screen">
      <div class="bg-primary-900/60 flex flex-col justify-center items-center min-h-screen">
        {!--
        <div class={
          "p-4 md:p-8 lg:p-16 mb-12 max-w-2xl",
          "space-y-4",
          "bg-primary-900/90  rounded-lg",
          "text-white text-md md:text-lg"
        }>
          <DateWindowListing />
          <LotteryDefinition />
        </div>
        <Components.Card padding={:lg}>
        <FormComponent id="reservation-form" step_one={@reservation} />
        </Components.Card>


        --}
        <Components.Card padding={:lg}>
          <Steps.FinalRemarks.FormComponent base_struct={%Steps.FinalRemarks{}} />
        </Components.Card>

        <Components.Card padding={:lg}>
          <Steps.Attendees.FormComponent base_struct={%Steps.Attendees{}} />
        </Components.Card>

        <Components.Card padding={:lg}>
          <Steps.RvDetails.FormComponent base_struct={%Steps.RvDetails{}} />
        </Components.Card>
        <Components.Card padding={:lg}>
          <Steps.TentingDetails.FormComponent base_struct={%Steps.TentingDetails{}} />
        </Components.Card>

        <Components.Card padding={:lg}>
          <Steps.BasicDetails.FormComponent base_struct={%Steps.BasicDetails{}} />
        </Components.Card>

        <Components.Card padding={:lg}>
          <Steps.ContactInfo.FormComponent base_struct={%Steps.ContactInfo{}} />
        </Components.Card>

        <Components.CallToAction type="redirect" to={Routes.page_path(Endpoint, :index)} size={:lg}>
          Back to Home Page
        </Components.CallToAction>
      </div>
    </div>
    """
  end
end
