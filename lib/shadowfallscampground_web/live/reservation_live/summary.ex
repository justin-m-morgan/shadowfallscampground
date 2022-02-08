defmodule ShadowfallscampgroundWeb.ReservationLive.Summary do
  @moduledoc """
  Summarization Component for entire wizard process
  """
  use ShadowfallscampgroundWeb, :component

  alias ShadowfallscampgroundWeb.ReservationLive.{SummaryDetails, SummaryPrices}

  @doc "Type of Request (to toggle type of request details)"
  prop type_of_request, :atom, required: true, values: [nil, :tent, :rv]

  @doc "Camper details changeset to summarize"
  prop camper_changeset, :map, required: true

  @doc "Basic reservation details changeset to summarize"
  prop reservation_changeset, :map, required: true

  @doc "Tenting specific details changeset to summarize"
  prop tent_details_changeset, :map, required: true

  @doc "RV specific details changeset to summarize"
  prop rv_details_changeset, :map, required: true

  def render(assigns) do
    ~F"""
    <div class="grid md:grid-cols-2 bg-primary-50 rounded-xl py-12 px-8">
      <SummaryDetails
        camper_struct={Ecto.Changeset.apply_changes(@camper_changeset)}
        reservation_struct={Ecto.Changeset.apply_changes(@reservation_changeset)}
        tent_details_struct={Ecto.Changeset.apply_changes(@tent_details_changeset)}
        rv_details_struct={Ecto.Changeset.apply_changes(@rv_details_changeset)}
      />
      <SummaryPrices reservation_struct={merge_structs(@reservation_changeset, @tent_details_changeset, @rv_details_changeset)} />
    </div>
    """
  end

  defp merge_structs(reservation_changeset, tent_details_changeset, rv_details_changeset) do
    reservation_changeset
    |> Ecto.Changeset.apply_changes()
    |> Map.put(:rv_details, Ecto.Changeset.apply_changes(rv_details_changeset))
    |> Map.put(:tent_details, Ecto.Changeset.apply_changes(tent_details_changeset))
  end
end
