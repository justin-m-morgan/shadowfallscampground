defmodule Shadowfallscampground.RequestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shadowfallscampground.Requests` context.
  """

  @doc """
  Generate a reservation.
  """
  def reservation_fixture(attrs \\ %{}) do
    {:ok, reservation} =
      attrs
      |> Enum.into(%{
        arrival: ~N[2022-03-09 22:16:00],
        departure: ~N[2022-03-09 22:16:00],
        type_of_request: :rv
      })
      |> Shadowfallscampground.Requests.create_reservation()

    reservation
  end
end
