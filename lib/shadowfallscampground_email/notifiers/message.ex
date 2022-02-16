defmodule ShadowfallscampgroundEmail.Notifiers.Message do
  @moduledoc """
  Receipt emails generated for general inquiry type messages
  """

  alias ShadowfallscampgroundEmail.{EmailsView, Recipient}

  def receipt(%{name: name, email: email}, message), do: receipt(name, email, message)
  def receipt({name, email}, message), do: receipt(name, email, message)

  def receipt(name, email, message) do
    {name, email}
    |> Recipient.new()
    |> EmailsView.new_email(
      subject: "Message Receipt",
      template: :message_receipt,
      assigns: %{message: message, auto_response_message: automated_response_message()}
    )
  end

  def message(%{name: name, email: email}, message), do: message(name, email, message)
  def message({name, email}, message), do: message(name, email, message)

  def message(name, email, message) do
    {"Bryan - Shadow Falls Campground", EmailsView.fetch_system_sender_email()}
    |> Recipient.new()
    |> EmailsView.new_email(
      subject: "General Inquiry",
      template: :message_inquiry,
      assigns: %{message: message, name: name, email: email},
      sender: {name, email}
    )
  end

  defp automated_response_message() do
    "This is an automated response to confirm your message. We are not always at the computer, especially during the offseason. Please allow up to 48 hours for a response before re-submitting your message."
  end
end
