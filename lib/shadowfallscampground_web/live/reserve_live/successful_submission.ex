defmodule ShadowfallscampgroundWeb.ReserveLive.SuccessfulSubmission do
  use ShadowfallscampgroundWeb, :live_component

  def render(assigns) do
    ~F"""
    <div class="px-4 py-8 space-y-4">
      <h3 class="font-bold text-3xl text-center pb-4">Great! Request Received!</h3>
      <p>We've received your request and you should be receiving an email receipt from us within the next minute or so. Please check your spam inbox if it appears you didn't receive this receipt. Even if you did not receive a receipt, if you are seeing this message then you can be assured that we have a copy of your request.
      </p>
      <p>Please allow us 48 hours to respond to your request (we will try for shorter, especially on last-minute requests). If you do not receive a response within 48 hours of your submission, please send us an email through the general inquiry/email links located on our main page (rather than re-submitting your request).</p>
      <p>If you would like to make another reservation for different dates, we have left your information pre-filled in the form as a convenience. Simply change the dates and make any other appropriate changes before submitting the form again.</p>
      <p />
    </div>
    """
  end
end
