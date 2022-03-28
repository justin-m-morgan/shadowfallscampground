defmodule ShadowfallscampgroundEmail.EmailsView.Partials.Reservations.Text do
  @moduledoc """
  Extracted partial templates for reservation text emails
  """
  alias ShadowfallscampgroundEmail.EmailsView.Utilities

  def contact_info_text(assigns) do
    contact_info = assigns["contact_info"]

    ~s"""
    Contact Info:
    --------------
    Legal Name:  #{contact_info["legal_name"]}
    Prefered Name:  #{contact_info["preferred_name"] || "None Provided"}
    Email:  #{contact_info["email"]}
    """
  end

  def reservation_basic_details_text(assigns) do
    ~s"""
    Basic Details
    -------------
    Scheduled Arrival: #{Utilities.parse_and_pretty_date(assigns["arrival"])}
    Scheduled Departure: #{Utilities.parse_and_pretty_date(assigns["departure"])}
    Type of Site: #{Utilities.humanize_form_values(assigns["type_of_request"])}
    """
  end

  def type_of_request_details(assigns) do
    case assigns["type_of_request"] do
      "tent" -> reservation_tenting_text(assigns["tent_details"])
      "rv" -> reservation_rv_text(assigns["rv_details"])
      _ -> reservation_unknown_text(%{})
    end
  end

  def reservation_tenting_text(assigns) do
    number_of_tents = assigns["number_of_tents"]
    power_requested = assigns["power_requested"]

    ~s"""
    Tenting Details:
    ----------------
    Number of Tents: #{number_of_tents}
    Power Requested: #{Utilities.humanize_form_values(power_requested)}
    """
  end

  def reservation_rv_text(assigns) do
    type_of_unit = assigns["type_of_unit"]
    length_of_unit = assigns["length_of_unit"]
    sewer_required = assigns["sewer_required"]

    ~s"""
    RV Details:
    -----------
    Type of Unit: #{Utilities.humanize_form_values(type_of_unit)}
    Length of Unit: #{Utilities.length_of_rv_formatter(length_of_unit)}
    Sewer Required: #{Utilities.humanize_form_values(sewer_required)}
    """
  end

  def reservation_unknown_text(_assigns) do
    ~s"""

    Hmm, the form didn't have a type of request selected...

    """
  end

  def guest_list(assigns) do
    booking_person =
      Utilities.display_legal_and_preferred_name(assigns["contact_info"], :preferred_first) <>
        "(Primary Contact)"

    guests =
      for attendee <- assigns["attendees"]["attendees"] do
        Utilities.display_legal_and_preferred_name(attendee, :preferred_first)
      end

    guest_list = [booking_person | guests]

    ~s"""
    Guest List:
    -----------
    #{Enum.join(guest_list, "\n")}

    (#{guest_list |> length() |> people_person()})
    """
  end

  defp people_person(1), do: "1 person"
  defp people_person(num), do: "#{num} people"

  def final_remarks(assigns) do
    final_remarks = assigns["final_remarks"]

    ~s"""
    Questions/Comments:
    -------------------
    #{final_remarks["remarks"]}
    """
  end
end
