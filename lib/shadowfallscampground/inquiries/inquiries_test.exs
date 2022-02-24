defmodule Shadowfallscampground.InquiriesTest do
  @moduledoc false
  use Shadowfallscampground.DataCase

  import Shadowfallscampground.Factories.Factory

  alias Shadowfallscampground.Inquiries
  alias Shadowfallscampground.Inquiries.Inquiry

  describe "inquiries" do
    test "list_inquiries/0 returns all inquiries" do
      inquiry = insert(:inquiry)
      assert Inquiries.list_inquiries() == [inquiry]
    end

    test "get_inquiry!/1 returns the inquiry with given id" do
      inquiry = insert(:inquiry)
      assert Inquiries.get_inquiry!(inquiry.id) == inquiry
    end

    test "create_inquiry/1 with valid data creates a inquiry" do
      valid_attrs = build(:inquiry_params)

      assert {:ok, %Inquiry{} = inquiry} = Inquiries.create_inquiry(valid_attrs)
      assert match_keys(inquiry, valid_attrs, [:email, :message, :name])
    end

    test "create_inquiry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               build(:invalid_inquiry_params)
               |> Inquiries.create_inquiry()
    end

    test "update_inquiry/2 with valid data updates the inquiry" do
      inquiry = insert(:inquiry)

      update_attrs = build(:inquiry_params)

      assert {:ok, %Inquiry{} = inquiry} = Inquiries.update_inquiry(inquiry, update_attrs)
      assert match_keys(inquiry, update_attrs, [:email, :message, :name])
    end

    test "update_inquiry/2 with invalid data returns error changeset" do
      inquiry = insert(:inquiry)

      assert {:error, %Ecto.Changeset{}} =
               Inquiries.update_inquiry(inquiry, build(:invalid_inquiry_params))

      assert inquiry == Inquiries.get_inquiry!(inquiry.id)
    end

    test "delete_inquiry/1 deletes the inquiry" do
      inquiry = insert(:inquiry)
      assert {:ok, %Inquiry{}} = Inquiries.delete_inquiry(inquiry)
      assert_raise Ecto.NoResultsError, fn -> Inquiries.get_inquiry!(inquiry.id) end
    end

    test "change_inquiry/1 returns a inquiry changeset" do
      inquiry = insert(:inquiry)
      assert %Ecto.Changeset{} = Inquiries.change_inquiry(inquiry)
    end
  end
end
