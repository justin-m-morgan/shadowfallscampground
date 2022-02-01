defmodule ShadowfallscampgroundWeb.Pages.Reserve do
  @moduledoc """
  Layout page for reservation form components
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Endpoint
  alias Shadowfallscampground.Requests.{Reservation, TentDetails, RvDetails}
  alias Shadowfallscampground.Identities.Camper
  alias ShadowfallscampgroundWeb.{CamperLive, ReservationLive}

  def render(assigns) do
    ~F"""
    <main class="flex flex-col container mx-auto pt-24" data-test="page__reserve">
      <CamperLive.FormComponent
        id="camper-form"
        camper={%Camper{}}
        action={:new}
        return_to={Routes.reserve_path(Endpoint, :new)}
      />
      <ReservationLive.FormComponent
        id="reservation-form"
        reservation={%Reservation{}}
        action={:new}
        return_to={Routes.reserve_path(Endpoint, :new)}
      />
      <ReservationLive.TentFormComponent
        id="tent-details-form"
        tent_details={%TentDetails{}}
        action={:new}
        return_to={Routes.reserve_path(Endpoint, :new)}
      />
      <ReservationLive.RvFormComponent
        id="rv-details-form"
        rv_details={%RvDetails{}}
        action={:new}
        return_to={Routes.reserve_path(Endpoint, :new)}
      />
    </main>
    """
  end
end
