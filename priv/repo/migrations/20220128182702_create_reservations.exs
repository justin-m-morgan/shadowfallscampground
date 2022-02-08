defmodule Shadowfallscampground.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add(:arrival, :date)
      add(:departure, :date)
      add(:type_of_request, :string)
      add(:booker_id, references(:campers))
      add(:guests, :jsonb)

      timestamps()
    end
  end
end
