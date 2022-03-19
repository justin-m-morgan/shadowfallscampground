defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.TentDetails do
  @moduledoc """
  Form component for providing tenting specific details
  """
  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Requests.TentDetails
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop changeset, :struct, required: true

  prop base_struct, :struct, default: %TentDetails{}

  def render(assigns) do
    ~F"""
    <div>
      <Steps.StepHandler
        id="tenting_details_form"
        data_test="tenting_details_form"
        title="Tenting Site Details"
        changeset={@changeset}
      >
        <Forms.RadioInput
          name={:power_requested}
          label="Power On-Site? ($5 per night)"
          mappings={[true: "Yes", false: "No"]}
          display_icon={false}
        />
        <Forms.RadioInput
          name={:number_of_tents}
          mappings={1..4 |> Enum.map(&{:"#{&1}", &1})}
          display_icon={false}
          class="grid-cols-4"
        />
        <p class="max-w-sm">If you have more tents, please break your reservation into multiple bookings. Such a group will need multiple sites. We prefer not to have one person responsible for large bookings.</p>
      </Steps.StepHandler>
    </div>
    """
  end
end
