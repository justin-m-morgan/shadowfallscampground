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
      {#if @changeset.valid?}
        <p class="pb-4 text-2xl font-bold">Awesome! Looks like we've got all the info we need.</p>

        <Components.CallToAction type="button" click="submit_form">
          Submit Form
        </Components.CallToAction>
      {#else}
        <p>It looks like we still have some errors in the following sections. Please review these sections. The outstanding sections should be clearly marked.</p>
      {/if}
    </div>
    """
  end

  def handle_event("submit_form", _, socket) do
    StepContainer.send_changeset_to_step_manager(%{event: :submit_form})

    {:noreply, socket}
  end
end
