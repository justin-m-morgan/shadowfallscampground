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
        <Steps.StepContainer
          id="reservation_form_step_container"
          :let={
            basic_details_changeset: basic_details_changeset,
            contact_info_changeset: contact_info_changeset,
            tenting_details_changeset: tenting_details_changeset,
            rv_details_changeset: rv_details_changeset,
            attendees_changeset: attendees_changeset,
            final_remarks_changeset: final_remarks_changeset
          }
        >
          <Components.Card padding={:lg} class="max-w-lg">
            <DateWindowListing />
          </Components.Card>

          <Components.Card padding={:lg} class="max-w-lg">
            <LotteryDefinition />
          </Components.Card>

          <Components.Card padding={:lg}>
            <Steps.ContactInfo.FormComponent
              base_struct={%Steps.ContactInfo{}}
              changeset={contact_info_changeset}
            />
          </Components.Card>

          <Components.Card padding={:lg}>
            <Steps.BasicDetails.FormComponent
              changeset={basic_details_changeset}
              base_struct={%Steps.BasicDetails{}}
            />
          </Components.Card>

          {#case Ecto.Changeset.get_change(basic_details_changeset, :type_of_request)}
            {#match :tent}
              <Components.Card padding={:lg}>
                <Steps.TentingDetails.FormComponent
                  changeset={tenting_details_changeset}
                  base_struct={%Steps.TentingDetails{}}
                />
              </Components.Card>
            {#match :rv}
              <Components.Card padding={:lg}>
                <Steps.RvDetails.FormComponent
                  changeset={rv_details_changeset}
                  base_struct={%Steps.RvDetails{}}
                />
              </Components.Card>
            {#match _}
              <Components.Card padding={:lg}>
                <p>Please select a type of request in the previous step</p>
              </Components.Card>
          {/case}

          <Components.Card padding={:lg}>
            <Steps.Attendees.FormComponent changeset={attendees_changeset} base_struct={%Steps.Attendees{}} />
          </Components.Card>

          <Components.Card padding={:lg}>
            <Steps.FinalRemarks.FormComponent
              changeset={final_remarks_changeset}
              base_struct={%Steps.FinalRemarks{}}
            />
          </Components.Card>
          <Components.Card padding={:lg} class="max-w-lg">
            <Steps.Summary
              basic_details_changeset={basic_details_changeset}
              contact_info_changeset={contact_info_changeset}
              tenting_details_changeset={tenting_details_changeset}
              rv_details_changeset={rv_details_changeset}
              attendees_changeset={attendees_changeset}
              final_remarks_changeset={final_remarks_changeset}
            />
          </Components.Card>
        </Steps.StepContainer>

        <Components.CallToAction type="redirect" to={Routes.page_path(Endpoint, :index)} size={:lg}>
          Back to Home Page
        </Components.CallToAction>
      </div>
    </div>
    """
  end
end
