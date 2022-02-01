defmodule Shadowfallscampground.IdentitiesTest do
  use Shadowfallscampground.DataCase

  import Shadowfallscampground.Factory

  alias Shadowfallscampground.Identities
  alias Shadowfallscampground.Identities.Camper

  describe "campers" do
    @invalid_attrs %{email: nil, name: nil}

    test "list_campers/0 returns all campers" do
      camper = insert(:camper)
      assert Identities.list_campers() == [camper]
    end

    test "get_camper!/1 returns the camper with given id" do
      camper = insert(:camper)
      assert Identities.get_camper!(camper.id) == camper
    end

    test "create_camper/1 with valid data creates a camper" do
      valid_attrs = build(:camper_params)

      assert {:ok, %Camper{} = camper} = Identities.create_camper(valid_attrs)
      assert camper.email == valid_attrs.email
      assert camper.name == valid_attrs.name
    end

    test "create_camper/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_camper(@invalid_attrs)
    end

    test "update_camper/2 with valid data updates the camper" do
      camper = insert(:camper)
      update_attrs = build(:camper_params)

      assert {:ok, %Camper{} = camper} = Identities.update_camper(camper, update_attrs)
      assert camper.email == update_attrs.email
      assert camper.name == update_attrs.name
    end

    test "update_camper/2 with invalid data returns error changeset" do
      camper = insert(:camper)
      assert {:error, %Ecto.Changeset{}} = Identities.update_camper(camper, @invalid_attrs)
      assert camper == Identities.get_camper!(camper.id)
    end

    test "delete_camper/1 deletes the camper" do
      camper = insert(:camper)
      assert {:ok, %Camper{}} = Identities.delete_camper(camper)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_camper!(camper.id) end
    end

    test "change_camper/1 returns a camper changeset" do
      camper = insert(:camper)
      assert %Ecto.Changeset{} = Identities.change_camper(camper)
    end
  end
end
