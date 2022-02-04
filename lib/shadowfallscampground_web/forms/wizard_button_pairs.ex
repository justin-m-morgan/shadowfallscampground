defmodule ShadowfallscampgroundWeb.Forms.WizardButtonPairs do
  @moduledoc """
  Back and Forward buttons for wizard
  """
  use ShadowfallscampgroundWeb, :component

  @doc "Make back button invisible"
  prop show_back, :boolean, default: true

  @doc "Action for back button to trigger"
  prop back_action, :event

  @doc "Valid form step (to enable forward button)"
  prop valid, :boolean, required: true

  def render(assigns) do
    ~F"""
    <div class="grid grid-cols-2 gap-2">
      <Components.CallToAction type="button" click={@back_action} class={invisible: !@show_back}>
        Back
      </Components.CallToAction>
      <Components.CallToAction
        type="submit"
        opts={phx_disable_with: "Saving...", disabled: !@valid}
        class={"bg-accent-200": !@valid}
      >
        Continue
      </Components.CallToAction>
    </div>
    """
  end
end
