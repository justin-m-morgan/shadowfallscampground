defmodule Shadowfallscampground.ReservationTest do
  use Shadowfallscampground.DataCase

  alias Shadowfallscampground.Requests.Reservation

  import Shadowfallscampground.Factories.Factory
  import Shadowfallscampground.Requests.Reservation, only: [changeset: 3]

  defp craft_basic_reservation_params(_context) do
    %{reservation_params: build(:reservation_params)}
  end

  defp set_start_and_end_of_season(_context) do
    %{
      start_of_season: ~D[2022-05-15],
      end_of_season: ~D[2022-09-15],
      opts: [start_of_season: ~D[2022-05-15], end_of_season: ~D[2022-09-15]]
    }
  end

  describe "reservations (basic changeset)" do
    setup [:craft_basic_reservation_params, :set_start_and_end_of_season]

    test "should accept non-controversial params", %{
      reservation_params: reservation_params,
      opts: opts
    } do
      changeset(%Reservation{}, reservation_params, opts)
      |> then(&assert &1.valid?)
    end

    test "should not accept a reservation with an arrival before the start of season", context do
      %{start_of_season: start_of_season} = context
      date_opts = [earliest: ~D[2022-01-01], latest: Date.add(start_of_season, -1)]
      reservation_params = build(:reservation_params, %{arrival: fake_datetime(date_opts)})

      changeset(%Reservation{}, reservation_params, context.opts)
      |> then(&refute &1.valid?)
    end

    test "should not accept a reservation with an departure before the start of season",
         context do
      %{start_of_season: start_of_season} = context
      date_opts = [earliest: ~D[2022-01-01], latest: Date.add(start_of_season, -1)]
      reservation_params = build(:reservation_params, %{departure: fake_datetime(date_opts)})

      changeset(%Reservation{}, reservation_params, context.opts)
      |> then(&refute &1.valid?)
    end

    test "should not accept a reservation with an arrival after the end of season", context do
      %{end_of_season: end_of_season} = context
      date_opts = [earliest: Date.add(end_of_season, 1), latest: ~D[2022-12-31]]
      reservation_params = build(:reservation_params, %{arrival: fake_datetime(date_opts)})

      changeset(%Reservation{}, reservation_params, context.opts)
      |> then(&refute &1.valid?)
    end

    test "should not accept a reservation with an departure after the end of season", context do
      %{end_of_season: end_of_season} = context
      date_opts = [earliest: Date.add(end_of_season, 1), latest: ~D[2022-12-31]]
      reservation_params = build(:reservation_params, %{departure: fake_datetime(date_opts)})

      changeset(%Reservation{}, reservation_params, context.opts)
      |> then(&refute &1.valid?)
    end

    test "should not accept a departure on or before arrival", context do
      arrival = context.opts[:start_of_season] |> Date.add(20)
      departure = Date.add(arrival, -10) |> NaiveDateTime.new!(~T[11:00:00])

      reservation_params =
        build(:reservation_params, %{
          arrival: arrival |> NaiveDateTime.new!(~T[13:00:00]),
          departure: departure
        })

      changeset(%Reservation{}, reservation_params, context.opts)
      |> then(&refute &1.valid?)
    end
  end
end
