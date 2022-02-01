defmodule Shadowfallscampground.Repo.Migrations.CreateCampers do
  use Ecto.Migration

  def change do
    create table(:campers) do
      add :name, :string
      add :email, :string

      timestamps()
    end
  end
end
