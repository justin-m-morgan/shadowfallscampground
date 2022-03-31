defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.Summary do
  @moduledoc """
  Summarization of form data pre-submission.
  """

  use ShadowfallscampgroundWeb, :live_component

  alias ShadowfallscampgroundWeb.ReserveLive.Steps.StepContainer

  prop changeset, :struct, required: true

  def render(assigns) do
    ~F"""
    <div>
      {#if form_valid?(@changeset)}
        <p class="pb-4 text-2xl font-bold">Awesome! Looks like we've got all the info we need.</p>

        <Components.CallToAction type="button" click="submit_form">
          Submit Form
        </Components.CallToAction>
      {#else}
        <p>It looks like we still have some incomplete fields above. Please review these sections</p>
      {/if}
    </div>
    """
  end

  defp form_valid?(changeset) do
    subs_valid =
      Enum.all?([:contact_info, :attendees], fn key ->
        case Map.get(changeset.changes, key) do
          nil -> false
          %Ecto.Changeset{} = sub_changeset -> sub_changeset.valid?
        end
      end)

    subs_valid and changeset.valid?
  end

  def handle_event("submit_form", _, socket) do
    StepContainer.send_changeset_to_step_manager(%{event: :submit_form})

    {:noreply, socket}
  end
end
