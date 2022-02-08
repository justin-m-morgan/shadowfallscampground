defmodule Shadowfallscampground.ReservationTest do
  use Shadowfallscampground.DataCase, async: true

  import Shadowfallscampground.Factory

  alias Shadowfallscampground.Requests.Reservation

  describe "valid reservation data - " do
    test "arrival should be before departure" do
      arrival = Faker.Date.forward(100)
      departure = Date.add(arrival, Enum.random(1..150))
      reservation_attrs = build(:reservation_params, %{arrival: arrival, departure: departure})
      changeset = Reservation.changeset(%Reservation{}, reservation_attrs)

      assert changeset.valid?
    end

    test "departure before arrival should be moved to one day after arrival" do
      departure = Faker.Date.forward(100)
      arrival = Date.add(departure, Enum.random(0..150))
      reservation_attrs = build(:reservation_params, %{arrival: arrival, departure: departure})
      changeset = Reservation.changeset(%Reservation{}, reservation_attrs)
      change_departure = Ecto.Changeset.get_change(changeset, :departure)

      assert change_departure == Date.add(arrival, 1)
    end

    # test "should accept tenting details" do
    #   tent_details = build(:tent_details)

    #   reservation_attrs =
    #     build(:reservation_params, type_of_request: "tenting", tent_details: tent_details)

    #   changeset = Reservation.changeset(%Reservation{}, reservation_attrs)
    #   tent_details_changeset = Ecto.Changeset.get_change(changeset, :tent_details)

    #   assert changeset.valid?
    #   assert tent_details_changeset.valid?
    # end

    # test "should accept rv details" do
    #   rv_details = build(:rv_details)

    #   reservation_attrs =
    #     build(:reservation_params, type_of_request: "rv", rv_details: rv_details)

    #   changeset = Reservation.changeset(%Reservation{}, reservation_attrs)
    #   rv_details_changeset = Ecto.Changeset.get_change(changeset, :rv_details)

    #   assert changeset.valid?
    #   assert rv_details_changeset.valid?
    # end
  end

  describe "associating a camper as booker" do
    test "should allow a new camper's details to be associated" do
      camper_details = build(:camper_params)
      attrs = build(:reservation_params, booker: camper_details)
      changeset = Reservation.wizard_changeset(%Reservation{}, attrs)

      assert %Ecto.Changeset{} = changeset.changes.booker
      assert changeset.changes.booker.valid?
    end
  end

  describe "associating several campers as guests" do
    test "should accept a single camper as a 'guest'" do
      camper_details = build(:camper_params)
      attrs = build(:reservation_params, campers: [camper_details])
      changeset = Reservation.wizard_changeset(%Reservation{}, attrs)

      assert is_list(changeset.changes.campers)
      Enum.each(changeset.changes.campers, &assert(%Ecto.Changeset{} = &1))
      Enum.each(changeset.changes.campers, &assert(&1.valid?))
    end

    test "should accept multiple campers as a 'guests'" do
      camper_details = build(:camper_params)
      attrs = build(:reservation_params, campers: [camper_details])
      changeset = Reservation.wizard_changeset(%Reservation{}, attrs)

      assert is_list(changeset.changes.campers)
      Enum.each(changeset.changes.campers, &assert(%Ecto.Changeset{} = &1))
      Enum.each(changeset.changes.campers, &assert(&1.valid?))
    end
  end

  property "should be a valid changeset" do
    check all(
            type_of_request <- member_of(Ecto.Enum.values(Reservation, :type_of_request)),
            arrival <- date_generator()
          ) do
      attrs = %{
        type_of_request: type_of_request,
        arrival: arrival,
        departure: Date.add(arrival, Enum.random(1..100))
      }

      changeset = Reservation.changeset(%Reservation{}, attrs)
      assert changeset.valid?
    end
  end

  defp date_generator() do
    map({integer(2020..2025), integer(1..12), integer(1..28)}, fn {y, m, d} ->
      Date.new!(y, m, d)
    end)
  end
end
