defmodule Shadowfallscampground.InquiriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shadowfallscampground.Inquiries` context.
  """

  @doc """
  Generate a inquiry.
  """
  def inquiry_fixture(attrs \\ %{}) do
    {:ok, inquiry} =
      attrs
      |> Enum.into(%{
        email: "some email",
        message: "some message",
        name: "some name"
      })
      |> Shadowfallscampground.Inquiries.create_inquiry()

    inquiry
  end
end
