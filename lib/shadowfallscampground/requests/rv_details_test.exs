defmodule Shadowfallscampground.RvDetailsTest do
  use Shadowfallscampground.DataCase, async: true

  # import Shadowfallscampground.Factory

  alias Shadowfallscampground.Requests.RvDetails

  describe "valid rv_details data - " do
  end

  property "should be a valid changeset" do
    check all(
            type_of_unit <- member_of(Ecto.Enum.values(RvDetails, :type_of_unit)),
            number_of_people <- integer(),
            length_of_unit <- integer(),
            sewer_required <- boolean()
          ) do
      attrs = %{
        type_of_unit: type_of_unit,
        number_of_people: number_of_people,
        length_of_unit: length_of_unit,
        sewer_required: sewer_required
      }

      changeset = RvDetails.changeset(%RvDetails{}, attrs)
      assert changeset.valid?
    end
  end
end
