defmodule Shadowfallscampground.Factories.Factory do
  @moduledoc """
  Factories for generating random data
  """

  use ExMachina.Ecto, repo: Shadowfallscampground.Repo

  use Shadowfallscampground.Factories.InquiryFactory
  use Shadowfallscampground.Factories.ReservationFactory
  use Shadowfallscampground.Factories.MailerJobFactory
end
