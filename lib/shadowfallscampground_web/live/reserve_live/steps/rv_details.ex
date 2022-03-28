defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.RvDetails do
  @moduledoc """
  Form component for providing RV specific details
  """
  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Requests.RvDetails
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop changeset, :struct, required: true

  def render(assigns) do
    ~F"""
    <div>
      <Steps.StepHandler
        id="rv_details_form"
        data_test="rv_details_form"
        title="RV Site Details"
        changeset={@changeset}
      >
        <Forms.RadioInput
          name={:type_of_unit}
          label="Type of Unit"
          schema_module={RvDetails}
          class="grid-cols-3"
        />
        <Forms.RadioInput name={:length_of_unit} mappings={RvDetails.rv_lengths()} display_icon={false} />
        <Forms.RadioInput
          name={:sewer_required}
          label="Sewer Hookup Required?"
          mappings={[true: "Yes", false: "No"]}
          display_icon={false}
        />
      </Steps.StepHandler>
    </div>
    """
  end
end
