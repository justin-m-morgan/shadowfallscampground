defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.StepContainer do
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests.{
    Reservation,
    ContactInfo,
    RvDetails,
    TentDetails,
    Attendees,
    FinalRemarks
  }

  defstruct [
    :basic_details_changeset,
    :contact_info_changeset,
    :tent_details_changeset,
    :rv_details_changeset,
    :attendees_changeset,
    :final_remarks_changeset,
    :submission_changeset
  ]

  prop changeset, :any, default: %{}
  data basic_details_changeset, :struct
  data contact_info_changeset, :struct
  data tent_details_changeset, :struct
  data rv_details_changeset, :struct
  data attendees_changeset, :struct
  data final_remarks_changeset, :struct
  data submission_changeset, :struct

  slot default,
    required: true,
    args: [
      :basic_details_changeset,
      :contact_info_changeset,
      :tent_details_changeset,
      :rv_details_changeset,
      :attendees_changeset,
      :final_remarks_changeset
    ]

  def render(assigns) do
    ~F"""
    <div class="grid gap-4 py-8">
      <#slot :args={
        basic_details_changeset: @basic_details_changeset,
        contact_info_changeset: @contact_info_changeset,
        tent_details_changeset: @tent_details_changeset,
        rv_details_changeset: @rv_details_changeset,
        attendees_changeset: @attendees_changeset,
        final_remarks_changeset: @final_remarks_changeset
      } />
    </div>
    """
  end

  def mount(socket) do
    socket
    |> assign(initiate_structs())
    |> then(&{:ok, &1})
  end

  def update(%{payload: _payload} = assigns, socket) do
    socket
    |> assign(assigns)
    |> assign_new_changeset(assigns)
    |> then(&{:ok, &1})
    |> tap(&IO.inspect/1)
  end

  def update(assigns, socket), do: {:ok, assign(socket, assigns)}

  defp assign_new_changeset(socket, assigns) do
    assigns.payload
    |> apply_changes()
    |> add_validation_action()
    |> tuple_to_map()
    |> then(&assign(socket, &1))
  end

  defp apply_changes(payload) do
    case payload do
      %{"reservation" => reservation_params} ->
        {:basic_details_changeset, Reservation.changeset(reservation_params)}

      %{"basic_details" => reservation_params} ->
        {:basic_details_changeset, Reservation.changeset(reservation_params)}

      %{"contact_info" => contact_info_params} ->
        {:contact_info_changeset, ContactInfo.changeset(contact_info_params)}

      %{"attendees" => attendees_params} ->
        {:attendees_changeset, Attendees.changeset(attendees_params)}

      %{"tent_details" => tent_details_params} ->
        {:tent_details_changeset, TentDetails.changeset(tent_details_params)}

      %{"rv_details" => rv_details_params} ->
        {:rv_details_changeset, RvDetails.changeset(rv_details_params)}

      %{"final_remarks" => final_remarks_params} ->
        {:final_remarks_changeset, FinalRemarks.changeset(final_remarks_params)}
    end
  end

  defp add_validation_action({key, changeset}), do: {key, Map.put(changeset, :action, :validate)}

  defp tuple_to_map({key, value}), do: Map.put(%{}, key, value)

  defp initiate_structs() do
    %{
      basic_details_changeset: Reservation.changeset(),
      contact_info_changeset: ContactInfo.changeset(),
      tent_details_changeset: TentDetails.changeset(),
      rv_details_changeset: RvDetails.changeset(),
      attendees_changeset: Attendees.changeset(),
      final_remarks_changeset: FinalRemarks.changeset()
    }
  end

  @doc """
  For consumption by other compenents to send messages to this component
  """
  def send_changeset_to_step_manager(
        manager_id \\ "reservation_form_step_container",
        payload
      ) do
    send_update(__MODULE__, id: manager_id, payload: payload)
  end
end
