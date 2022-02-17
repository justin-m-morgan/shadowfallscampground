defmodule Shadowfallscampground.Repo do
  use Ecto.Repo,
    otp_app: :shadowfallscampground,
    adapter: Ecto.Adapters.Postgres
end
