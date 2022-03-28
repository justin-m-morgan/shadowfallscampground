defmodule Shadowfallscampground.RequestsTest do
  use Shadowfallscampground.DataCase

  alias Shadowfallscampground.Requests

  describe "reservations" do
    alias Shadowfallscampground.Requests.Reservation

    import Shadowfallscampground.RequestsFixtures

    @invalid_attrs %{arrival: nil, departure: nil, type_of_request: nil}

    test "list_reservations/0 returns all reservations" do
      reservation = reservation_fixture()
      assert Requests.list_reservations() == [reservation]
    end

    test "get_reservation!/1 returns the reservation with given id" do
      reservation = reservation_fixture()
      assert Requests.get_reservation!(reservation.id) == reservation
    end

    test "create_reservation/1 with valid data creates a reservation" do
      valid_attrs = %{
        arrival: ~N[2022-03-09 22:16:00],
        departure: ~N[2022-03-09 22:16:00],
        type_of_request: :rv
      }

      assert {:ok, %Reservation{} = reservation} = Requests.create_reservation(valid_attrs)
      assert reservation.arrival == ~N[2022-03-09 22:16:00]
      assert reservation.departure == ~N[2022-03-09 22:16:00]
      assert reservation.type_of_request == :rv
    end

    test "create_reservation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Requests.create_reservation(@invalid_attrs)
    end

    test "update_reservation/2 with valid data updates the reservation" do
      reservation = reservation_fixture()

      update_attrs = %{
        arrival: ~N[2022-03-10 22:16:00],
        departure: ~N[2022-03-10 22:16:00],
        type_of_request: :tent
      }

      assert {:ok, %Reservation{} = reservation} =
               Requests.update_reservation(reservation, update_attrs)

      assert reservation.arrival == ~N[2022-03-10 22:16:00]
      assert reservation.departure == ~N[2022-03-10 22:16:00]
      assert reservation.type_of_request == :tent
    end

    test "update_reservation/2 with invalid data returns error changeset" do
      reservation = reservation_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Requests.update_reservation(reservation, @invalid_attrs)

      assert reservation == Requests.get_reservation!(reservation.id)
    end

    test "delete_reservation/1 deletes the reservation" do
      reservation = reservation_fixture()
      assert {:ok, %Reservation{}} = Requests.delete_reservation(reservation)
      assert_raise Ecto.NoResultsError, fn -> Requests.get_reservation!(reservation.id) end
    end

    test "change_reservation/1 returns a reservation changeset" do
      reservation = reservation_fixture()
      assert %Ecto.Changeset{} = Requests.change_reservation(reservation)
    end
  end
end
