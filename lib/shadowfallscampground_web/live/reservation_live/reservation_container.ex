defmodule ShadowfallscampgroundWeb.ReservationLive.ReservationContainer do
  @moduledoc """
  Container for the multi-step process of a reservation form submission
  """
  require Logger

  use ShadowfallscampgroundWeb, :live_component

  @doc "Changeset for camper resource"
  data camper_changeset, :map, default: nil

  @doc "Changeset for reservation resource"
  data reservation_changeset, :map, default: nil

  @doc "Changeset for tenting_details resource"
  data tenting_details_changeset, :map, default: nil

  @doc "Changeset for rv resource"
  data rv_details_changeset, :map, default: nil

  slot default,
    args: [
      :type_of_request,
      :camper_changeset,
      :reservation_changeset,
      :tenting_details_changeset,
      :rv_details_changeset
    ]

  def render(assigns) do
    ~F"""
    <div>
      <#slot :args={
        type_of_request: get_type_of_request(@reservation_changeset),
        camper_changeset: @camper_changeset,
        reservation_changeset: @reservation_changeset,
        tenting_details_changeset: @tenting_details_changeset,
        rv_details_changeset: @rv_details_changeset
      } />
      <div class="p-12 bg-primary-50">
        {#for changeset <- [
            @camper_changeset,
            @reservation_changeset,
            @tenting_details_changeset,
            @rv_details_changeset
          ]}
          <pre :if={changeset}>
            {Jason.encode!(changeset.changes, pretty: true)}
            Type of request: {get_type_of_request(@reservation_changeset)}
          </pre>
        {/for}
      </div>
    </div>
    """
  end

  defp get_type_of_request(%Ecto.Changeset{} = changeset),
    do: Ecto.Changeset.get_change(changeset, :type_of_request)

  defp get_type_of_request(_), do: nil
end
