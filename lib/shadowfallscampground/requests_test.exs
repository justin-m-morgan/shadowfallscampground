defmodule Shadowfallscampground.RequestsTest do
  use Shadowfallscampground.DataCase

  alias Shadowfallscampground.Requests

  describe "reservations" do
    alias Shadowfallscampground.Requests.Reservation

    # import Shadowfallscampground.RequestsFixtures
    import Shadowfallscampground.Factory

    @invalid_attrs %{arrival: nil, departure: nil, email: nil, name: nil, type_of_request: nil}

    test "list_reservations/0 returns all reservations" do
      reservation = insert(:reservation)
      assert Requests.list_reservations() == [reservation]
    end

    test "get_reservation!/1 returns the reservation with given id" do
      reservation = insert(:reservation)
      assert Requests.get_reservation!(reservation.id) == reservation
    end

    test "create_reservation/1 with valid data creates a reservation" do
      valid_attrs = build(:reservation_params)

      comprable_attrs = %{
        valid_attrs
        | type_of_request: String.to_atom(valid_attrs.type_of_request)
      }

      assert {:ok, %Reservation{} = reservation} = Requests.create_reservation(valid_attrs)
      assert is_subset(comprable_attrs, reservation)
    end

    test "create_reservation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Requests.create_reservation(@invalid_attrs)
    end

    test "update_reservation/2 with valid data updates the reservation" do
      reservation = insert(:reservation)
      update_attrs = build(:reservation_params)

      comprable_attrs = %{
        update_attrs
        | type_of_request: String.to_atom(update_attrs.type_of_request)
      }

      assert {:ok, %Reservation{} = reservation} =
               Requests.update_reservation(reservation, update_attrs)

      assert is_subset(comprable_attrs, reservation)
    end

    test "update_reservation/2 with invalid data returns error changeset" do
      reservation = insert(:reservation)

      assert {:error, %Ecto.Changeset{}} =
               Requests.update_reservation(reservation, @invalid_attrs)

      assert reservation == Requests.get_reservation!(reservation.id)
    end

    test "delete_reservation/1 deletes the reservation" do
      reservation = insert(:reservation)
      assert {:ok, %Reservation{}} = Requests.delete_reservation(reservation)
      assert_raise Ecto.NoResultsError, fn -> Requests.get_reservation!(reservation.id) end
    end

    test "change_reservation/1 returns a reservation changeset" do
      reservation = insert(:reservation)
      assert %Ecto.Changeset{} = Requests.change_reservation(reservation)
    end
  end
end
