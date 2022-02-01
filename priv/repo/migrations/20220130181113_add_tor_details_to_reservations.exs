defmodule Shadowfallscampground.Repo.Migrations.AddTorDetailsToReservations do
  use Ecto.Migration

  def change do
    alter table("reservations") do
      add :rv_details, :jsonb
      add :tent_details, :jsonb
    end
  end
end
