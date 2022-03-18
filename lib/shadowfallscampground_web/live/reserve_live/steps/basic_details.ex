defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.BasicDetails do
  @moduledoc """
  Context focused module for form steps
  """

  use Ecto.Schema
  import Ecto.Changeset

  @arrival_time "16"
  @departure_time "11"

  embedded_schema do
    field :arrival, :naive_datetime
    field :departure, :naive_datetime
    field :type_of_request, Ecto.Enum, values: [:rv, :tent]
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(basic_details \\ %__MODULE__{}, attrs) do
    basic_details
    |> cast(add_times_to_dates(attrs), [:arrival, :departure, :type_of_request])
    |> maybe_bump_departure()
    |> validate_required([:arrival, :departure, :type_of_request])
    |> validate_departure_after_arrival()
  end

  defp maybe_bump_departure(changeset) do
    arrival = get_field(changeset, :arrival)
    departure = get_change(changeset, :departure)
    one_day = Timex.Duration.from_days(1)

    cond do
      is_nil(arrival) ->
        changeset

      is_nil(departure) ->
        put_change(changeset, :departure, Timex.add(arrival, one_day))

      not Timex.before?(arrival, departure) ->
        put_change(changeset, :departure, Timex.add(arrival, one_day))

      true ->
        changeset
    end
  end

  defp add_times_to_dates(params) do
    params
    |> Map.put("arrival", add_time_to_dates(params["arrival"], @arrival_time))
    |> Map.put("departure", add_time_to_dates(params["departure"], @departure_time))
  end

  defp add_time_to_dates(date_component, hour, minute \\ "0", second \\ "0")
  defp add_time_to_dates(nil, _hour, _minute, _second), do: nil

  defp add_time_to_dates(date_components, hour, minute, second) do
    date_components
    |> Map.put("hour", hour)
    |> Map.put("minute", minute)
    |> Map.put("second", second)
  end

  defp validate_departure_after_arrival(changeset) do
    arrival = get_change(changeset, :arrival)
    departure = get_change(changeset, :departure)

    case date_on_or_before(departure, arrival) do
      true -> add_error(changeset, :departure, "Departure must be after arrival")
      false -> changeset
    end
  end

  defp date_on_or_before(nil, _comparison), do: true
  defp date_on_or_before(date, comparison), do: not Timex.after?(date, comparison)

  defmodule FormComponent do
    @moduledoc """
    Form component for step one
    """
    use ShadowfallscampgroundWeb, :component

    alias Shadowfallscampground.Requests
    alias ShadowfallscampgroundWeb.Forms
    alias ShadowfallscampgroundWeb.ReserveLive.Steps

    prop base_struct, :struct, required: true

    prop changeset, :struct, required: true

    def render(assigns) do
      ~F"""
      <div>
        <Steps.StepHandler
          id="basic_details_form"
          data_test="basic_details_form"
          title="Basic Details"
          changeset_fn={&Steps.BasicDetails.changeset/2}
          base_struct={@base_struct}
        >
          <Forms.DateRangeInput
            id="basic_details_date_range_input"
            form={:basic_details}
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
            schema_module={Steps.BasicDetails}
            checked_override={@changeset.changes[:type_of_request]}
          />
        </Steps.StepHandler>
      </div>
      """
    end
  end
end
