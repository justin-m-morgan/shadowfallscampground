defmodule ShadowfallscampgroundEmail.Notifiers.Reservation do
  @moduledoc """
  Receipt emails generated for reservation submissions
  """

  alias ShadowfallscampgroundEmail.{EmailsView, Recipient}
  alias ShadowfallscampgroundEmail.EmailsView.Utilities

  def receipt(%{"contact_info" => %{"legal_name" => name, "email" => email}} = form_submission),
    do: receipt(name, email, form_submission)

  def receipt(%{name: name, email: email} = form_submission),
    do: receipt(name, email, form_submission)

  def receipt({name, email}, form_submission), do: receipt(name, email, form_submission)

  def receipt(name, email, form_submission) do
    form_submission = form_submission_adapter(form_submission)

    {name, email}
    |> Recipient.new()
    |> EmailsView.new_email(
      subject: "(Receipt)" <> subject_line_generator(form_submission),
      template: :reservation_receipt,
      assigns: %{
        form_submission: form_submission,
        auto_response_message: automated_response_message()
      }
    )
  end

  # def message(%{"name" => name, "email" => email, "message" => message}),
  #   do: message(name, email, message)

  def message(%{"contact_info" => %{"legal_name" => name, "email" => email}} = form_submission),
    do: message(name, email, form_submission)

  def message(%{contact_info: %{legal_name: name, email: email}} = form_submission),
    do: message(name, email, form_submission)

  def message({name, email}, form_submission), do: message(name, email, form_submission)

  def message(name, email, form_submission) do
    form_submission = form_submission_adapter(form_submission)

    {"Bryan - Shadow Falls Campground", EmailsView.fetch_system_sender_email()}
    |> Recipient.new()
    |> EmailsView.new_email(
      subject: subject_line_generator(form_submission),
      template: :reservation_submission,
      assigns: %{
        form_submission: form_submission,
        auto_response_message: automated_response_message()
      },
      sender: {name, email}
    )
  end

  defp subject_line_generator(form_submission) do
    pretty_arrival = form_submission["arrival"] |> pretty_date()
    pretty_departure = form_submission["departure"] |> pretty_date()

    "Reservation Request - #{pretty_arrival} - #{pretty_departure}"
  end

  defp automated_response_message() do
    ~s"""
    This is an automated response to confirm your message. We are not always at the computer, especially during the offseason. Please allow up to 48 hours for a response before re-submitting your message.

    A reminder that this message is NOT A CONFIRMATION OF A SITE. That will happen with a follow up email.
    """
  end

  defp pretty_date(string_date) do
    Utilities.parse_and_pretty_date(string_date)
  end

  defp form_submission_adapter(form_submission) do
    form_submission

    # |> Reservation.changeset()
    # |> Ecto.Changeset.apply_changes()

    # |> Reservation.coerce_reservation_to_map()
  end
end
