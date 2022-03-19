defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.FinalRemarks do
  @moduledoc """
  Form component for final remarks
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop changeset, :struct, required: true

  def render(assigns) do
    ~F"""
    <div>
      <Steps.StepHandler
        id="final_remarks_form"
        data_test="final_remarks_form"
        title="Questions/Comments"
        changeset={@changeset}
      >
        <Forms.TextArea name={:remarks} label="Message (Optional)" />
      </Steps.StepHandler>
    </div>
    """
  end
end
