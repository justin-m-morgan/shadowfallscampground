defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.Summary do
  use ShadowfallscampgroundWeb, :component

  prop basic_details_changeset, :struct, required: true
  prop contact_info_changeset, :struct, required: true
  prop tenting_details_changeset, :struct, required: true
  prop rv_details_changeset, :struct, required: true
  prop attendees_changeset, :struct, required: true
  prop final_remarks_changeset, :struct, required: true

  def render(assigns) do
    ~F"""
    <div>
      {#if any_errors?(assigns)}
        <p>It looks like we still have some errors in the following sections. Please review these sections. The outstanding sections should be clearly marked.</p>
        <ul>
          {#for {label, changeset} <- invalid_changesets(assigns)}
            <li>{label}</li>
          {/for}
        </ul>
      {#else}
        <p>This is the valid section</p>
      {/if}
    </div>
    """
  end

  defp invalid_changesets(assigns) do
    [
      {"Basic Details", assigns.basic_details_changeset},
      {"Contact Info", assigns.contact_info_changeset},
      swap_tor_details_changeset(assigns),
      {"Attendees", assigns.attendees_changeset},
      {"Final Remarks", assigns.final_remarks_changeset}
    ]
    |> Enum.reject(fn {label, changeset} -> changeset.valid? end)
  end

  defp swap_tor_details_changeset(assigns) do
    case assigns.basic_details_changeset.changes[:type_of_request] do
      :tent -> {"Tenting Details", assigns.tenting_details_changeset}
      :rv -> {"RV Details", assigns.rv_details_changeset}
      _ -> {"Type of Request Details", assigns.rv_details_changeset}
    end
  end

  defp any_errors?(assigns) do
    assigns
    |> invalid_changesets()
    |> length()
    |> Kernel.>(0)
  end
end
