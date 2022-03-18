defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.StepContainer do
  use ShadowfallscampgroundWeb, :live_component

  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  defstruct [
    :basic_details_changeset,
    :contact_info_changeset,
    :tenting_details_changeset,
    :rv_details_changeset,
    :attendees_changeset,
    :final_remarks_changeset
  ]

  prop changeset, :any, default: %{}
  data basic_details_changeset, :struct
  data contact_info_changeset, :struct
  data tenting_details_changeset, :struct
  data rv_details_changeset, :struct
  data attendees_changeset, :struct
  data final_remarks_changeset, :struct

  slot default,
    required: true,
    args: [
      :basic_details_changeset,
      :contact_info_changeset,
      :tenting_details_changeset,
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
        tenting_details_changeset: @tenting_details_changeset,
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

  def update(assigns, socket) do
    socket
    |> assign(assigns)
    |> assign(compute_changeset_key(assigns[:changeset]), assigns[:changeset])
    |> then(&{:ok, &1})
  end

  defp compute_changeset_key(changeset) do
    IO.inspect(changeset)

    case Map.get(changeset, :data, nil) do
      %Steps.BasicDetails{} -> :basic_details_changeset
      %Steps.ContactInfo{} -> :contact_info_changeset
      %Steps.TentingDetails{} -> :tenting_details_changeset
      %Steps.RvDetails{} -> :rv_details_changeset
      %Steps.Attendees{} -> :attendees_changeset
      %Steps.FinalRemarks{} -> :final_remarks_changeset
      _ -> :changeset
    end
  end

  defp compute_changeset_key(_), do: :changeset

  defp initiate_structs() do
    %{
      basic_details_changeset: Steps.BasicDetails.changeset(),
      contact_info_changeset: Steps.ContactInfo.changeset(),
      tenting_details_changeset: Steps.TentingDetails.changeset(),
      rv_details_changeset: Steps.RvDetails.changeset(),
      attendees_changeset: Steps.Attendees.changeset(),
      final_remarks_changeset: Steps.FinalRemarks.changeset()
    }
  end

  def send_changeset_to_step_manager(
        manager_id \\ "reservation_form_step_container",
        changeset
      ) do
    send_update(__MODULE__, id: manager_id, changeset: changeset)
  end
end
