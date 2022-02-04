defmodule ShadowfallscampgroundWeb.Pages.Reserve do
  @moduledoc """
  Layout page for reservation form components
  """
  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Requests.{Reservation, TentDetails, RvDetails}
  alias Shadowfallscampground.Identities.Camper
  alias ShadowfallscampgroundWeb.ReservationLive

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <main class="flex flex-col container mx-auto pt-24" data-test="page__reserve">
      <ReservationLive.ReservationContainer
        id="reservation-container"
        :let={
          type_of_request: type_of_request,
          camper_changeset: camper_changeset,
          reservation_changeset: reservation_changeset,
          tenting_details_changeset: tenting_details_changeset,
          rv_details_changeset: rv_details_changeset
        }
      >
        <ReservationLive.Wizard id="reservation-wizard">
          <ReservationLive.WizardStep>
            <ReservationLive.CamperFormComponent
              id="camper-form"
              camper={%Camper{}}
              camper_changeset={camper_changeset}
            />
          </ReservationLive.WizardStep>
          <ReservationLive.WizardStep>
            <ReservationLive.ReservationFormComponent
              id="reservation-form"
              reservation={%Reservation{}}
              reservation_changeset={reservation_changeset}
            />
          </ReservationLive.WizardStep>
          <ReservationLive.WizardStep>
            {#case type_of_request}
              {#match :tent}
                <ReservationLive.TentFormComponent
                  id="tent-details-form"
                  tent_details={%TentDetails{}}
                  tent_changeset={tenting_details_changeset}
                />
              {#match :rv}
                <ReservationLive.RvFormComponent
                  id="rv-details-form"
                  rv_details={%RvDetails{}}
                  rv_changeset={rv_details_changeset}
                />
              {#match _}
                <p class="text-primary-50 text-xl font-bold text-center">Please select a type of request</p>
            {/case}
          </ReservationLive.WizardStep>
        </ReservationLive.Wizard>
      </ReservationLive.ReservationContainer>
    </main>
    """
  end
end
