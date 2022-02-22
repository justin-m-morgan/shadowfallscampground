defmodule Shadowfallscampground.Factories.Factory do
  @moduledoc """
  Factories for generating random data
  """

  use ExMachina.Ecto, repo: Shadowfallscampground.Repo

  use Shadowfallscampground.Factories.InquiryFactory

end
