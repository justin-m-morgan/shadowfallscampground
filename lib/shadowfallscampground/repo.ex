defmodule Shadowfallscampground.Repo do
  use Ecto.Repo,
    otp_app: :shadowfallscampground,
    adapter: Ecto.Adapters.SQLite3
end
