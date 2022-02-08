defmodule Shadowfallscampground.Repo.Migrations.AddReservationCampersTable do
  use Ecto.Migration

  def change do
    create table(:reservation_campers) do
      add(:reservation_id, references(:reservations))
      add(:camper_id, references(:campers))

      timestamps()
    end

    create(index(:reservation_campers, :reservation_id))
    create(index(:reservation_campers, :camper_id))
  end
end
