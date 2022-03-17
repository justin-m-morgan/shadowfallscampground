defmodule Shadowfallscampground.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :arrival, :naive_datetime
      add :departure, :naive_datetime
      add :type_of_request, :string

      timestamps()
    end
  end
end
