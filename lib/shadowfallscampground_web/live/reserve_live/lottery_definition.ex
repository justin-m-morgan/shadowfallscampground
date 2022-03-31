defmodule ShadowfallscampgroundWeb.ReserveLive.LotteryDefinition do
  use ShadowfallscampgroundWeb, :component

  def render(assigns) do
    ~F"""
    <div>
      <h2 class="font-bold text-md lg:text-xl pb-2">"Lottery" System for First Day of Bookings</h2>
      <p>We will be assigning sites by a sort-of "lottery" system to avoid a race when the booking window opens. The "lottery" simply means that all reservations submitted on the first day available for a given period will be given a random order of submission after the close of the lottery period. </p>
    </div>
    """
  end
end
