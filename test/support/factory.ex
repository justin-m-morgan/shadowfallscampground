defmodule Shadowfallscampground.Factory do
  @moduledoc """
  Factory functions for use in tests
  """

  use ExMachina.Ecto, repo: Shadowfallscampground.Repo

  use Shadowfallscampground.ReservationFactory
  use Shadowfallscampground.CamperFactory
end
