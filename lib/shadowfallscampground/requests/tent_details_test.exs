defmodule Shadowfallscampground.TentDetailsTest do
  use Shadowfallscampground.DataCase, async: true

  # import Shadowfallscampground.Factory

  alias Shadowfallscampground.Requests.TentDetails

  describe "valid tent_details data - " do
  end

  property "should be a valid changeset" do
    check all(
            number_of_people <- integer(),
            number_of_tents <- integer(),
            power_requested <- boolean()
          ) do
      attrs = %{
        number_of_people: number_of_people,
        number_of_tents: number_of_tents,
        power_requested: power_requested
      }

      changeset = TentDetails.changeset(%TentDetails{}, attrs)
      assert changeset.valid?
    end
  end
end
