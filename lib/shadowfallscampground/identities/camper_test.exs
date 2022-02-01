defmodule Shadowfallscampground.CamperTest do
  use Shadowfallscampground.DataCase, async: true

  # import Shadowfallscampground.Factory

  alias Shadowfallscampground.Identities.Camper

  describe "valid camper data - " do
  end

  property "should be a valid changeset" do
    check all(
            name <- string(:ascii, min_length: 1),
            email <- email_generator()
          ) do
      attrs = %{name: name, email: email}
      changeset = Camper.changeset(%Camper{}, attrs)
      assert changeset.valid?
    end
  end

  defp email_generator() do
    map(
      {
        string(:alphanumeric, min_length: 1),
        string(:alphanumeric, min_length: 1),
        string(:alphanumeric, min_length: 1, max_length: 3)
      },
      fn {left, subdomain, tldomain} -> left <> "@" <> subdomain <> "." <> tldomain end
    )
  end
end
