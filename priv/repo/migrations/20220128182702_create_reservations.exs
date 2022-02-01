defmodule Shadowfallscampground.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :arrival, :date
      add :departure, :date
      add :type_of_request, :string
      add :camper_id, references(:campers)

      timestamps()
    end
  end
end
