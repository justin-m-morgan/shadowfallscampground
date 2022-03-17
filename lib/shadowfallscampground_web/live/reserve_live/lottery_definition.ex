defmodule ShadowfallscampgroundWeb.ReserveLive.LotteryDefinition do
  use ShadowfallscampgroundWeb, :component

  def render(assigns) do
    ~F"""
    <div>
      <h2 class="font-bold text-md lg:text-xl pb-2">"Lottery" System for First Day of Bookings</h2>
      <p>We will be assigning sites by a sort-of "lottery" system to avoid a race when the booking window opens. The "lottery" simply means that all reservations submitted on the first day available for a given date will be given a random order of submission. All bookings made between 12:00am and 11:59pm of the dates listed in the left column above will have an equal chance of securing a site should the reservations exceed our number of available sites for your chosen dates.</p>
    </div>
    """
  end
end
