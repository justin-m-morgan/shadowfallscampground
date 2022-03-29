defmodule ShadowfallscampgroundEmail.EmailsView.Partials.Reservations.Html do
  @moduledoc """
  Extracted partial templates for reservation text emails
  """
  alias ShadowfallscampgroundEmail.EmailsView.Utilities

  import Phoenix.HTML

  defp heading(text) do
    ~E"""
    <h3><%= text %></h3>
    """
  end

  def contact_info_text(assigns) do
    contact_info = assigns["contact_info"]

    ~E"""

    <mj-text>
      <%= heading("Contact Info") %>
      <p> Legal Name:  <%= contact_info["legal_name"] %></p>
      <p>Prefered Name:  <%= contact_info["preferred_name"] || "None Provided" %></p>
      <p>Email:  <%= contact_info["email"] %></p>
    </mj-text>

    """
  end

  def reservation_basic_details_text(assigns) do
    ~E"""

    <mj-text>
      <%= heading("Basic Details") %>
      <p>Scheduled Arrival: <%= Utilities.parse_and_pretty_date(assigns["arrival"]) %> </p>
      <p>Scheduled Departure: <%= Utilities.parse_and_pretty_date(assigns["departure"]) %> </p>
      <p>Type of Site: <%= Utilities.humanize_form_values(assigns["type_of_request"]) %> </p>
    </mj-text>

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

    ~E"""

    <mj-text>
      <%= heading("Tenting Details") %>
      <p>Number of Tents: <%= number_of_tents %></p>
      <p>Power Requested: <%= Utilities.humanize_form_values(power_requested) %></p>
    </mj-text>

    """
  end

  def reservation_rv_text(assigns) do
    type_of_unit = assigns["type_of_unit"]
    length_of_unit = assigns["length_of_unit"]
    sewer_required = assigns["sewer_required"]

    ~E"""

    <mj-text>
      <%= heading("RV Details") %>

      <p>Type of Unit: <%= Utilities.humanize_form_values(type_of_unit) %></p>
      <p>Length of Unit: <%= Utilities.length_of_rv_formatter(length_of_unit) %></p>
      <p>Sewer Required: <%= Utilities.humanize_form_values(sewer_required) %></p>
    </mj-text>

    """
  end

  def reservation_unknown_text(_assigns) do
    ~E"""
    <mj-text>
        <p>Hmm, the form didn't have a type of request selected...</p>
    </mj-text>

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

    ~E"""

    <mj-text>
        <%= heading("Guest List") %>
        <%= for guest <- guest_list do %>
          <p><%= guest %></p>
        <% end %>

        <p>(<%= guest_list |> length() |> people_person() %>)</p>
    </mj-text>

    """
  end

  defp people_person(1), do: "1 person"
  defp people_person(num), do: "#{num} people"

  def final_remarks(assigns) do
    final_remarks = assigns["final_remarks"]

    ~E"""

    <mj-text>
        <%= heading("Questions/Comments") %>
        <p><%= final_remarks["remarks"] %></p>
    </mj-text>

    """
  end
end
