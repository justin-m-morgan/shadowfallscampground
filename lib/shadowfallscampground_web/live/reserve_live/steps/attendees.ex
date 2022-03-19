defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.Attendees do
  @moduledoc """
  Form component for listing attendees to a reservation
  """
  use ShadowfallscampgroundWeb, :component

  alias Shadowfallscampground.Requests.Attendees
  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop base_struct, :struct, default: %Attendees{}

  prop changeset, :struct, required: true

  def render(assigns) do
    ~F"""
    <div>
      <Steps.StepHandler
        id="attendees_form"
        data_test="attendees_form"
        title="Guest List"
        changeset={@changeset}
      >
        <p class="max-w-sm">
          <strong>Other than yourself,</strong> how many people will be accompanying your on this trip?
        </p>
        <Forms.RadioInput
          name={:number_of_people}
          mappings={number_of_people_mappings()}
          display_icon={false}
          class="grid-cols-6"
        />

        <p class="max-w-sm">
          If you have more people in your group, please break up your reservation into multiple smaller groups.
        </p>

        {#if number_of_guests(@changeset) > 0}
          {#for num <- number_of_people_generator(@changeset)}
            <fieldset class="border-2 border-gray-300 py-2 px-3">
              <legend>Person {num + 1}</legend>
              <Forms.TextInput name={:"#{num}[legal_name]"} label="Legal Name" />
              <Forms.TextInput name={:"#{num}[preferred_name]"} label="Preferred Name (Optional)" />
            </fieldset>
          {/for}
        {/if}
      </Steps.StepHandler>
    </div>
    """
  end

  defp number_of_guests(changeset) do
    Ecto.Changeset.get_change(changeset, :number_of_people, 0)
  end

  defp number_of_people_mappings() do
    0..11
    |> Enum.map(&{:"#{&1}", "#{&1}"})
  end

  defp number_of_people_generator(changeset) do
    changeset
    |> number_of_guests()
    |> then(&Range.new(0, &1 - 1))
  end
end
