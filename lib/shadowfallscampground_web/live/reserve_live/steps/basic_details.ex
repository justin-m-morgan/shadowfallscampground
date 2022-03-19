defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.BasicDetails do
  @moduledoc """
  Form component for inserting basic reservation details
  """
  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Requests.Reservation
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop base_struct, :struct, default: %Reservation{}

  prop changeset, :struct, required: true

  def render(assigns) do
    ~F"""
    <div>
      <Steps.StepHandler
        id="basic_details_form"
        data_test="basic_details_form"
        title="Basic Details"
        changeset={@changeset}
      >
        <Forms.DateRangeInput
          id="basic_details_date_range_input"
          form={:reservation}
          start_date_field={:arrival}
          end_date_field={:departure}
          min_date={~D[2022-05-15]}
          max_date={~D[2022-09-15]}
          focused_start_date={@changeset.changes[:arrival]}
          focused_end_date={@changeset.changes[:departure]}
          year={2022}
        />
        <Forms.RadioInput
          name={:type_of_request}
          label="Type of Request"
          schema_module={Reservation}
          checked_override={@changeset.changes[:type_of_request]}
        />
      </Steps.StepHandler>
    </div>
    """
  end
end
