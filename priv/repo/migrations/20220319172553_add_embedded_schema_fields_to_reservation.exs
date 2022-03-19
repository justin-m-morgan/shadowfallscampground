defmodule Shadowfallscampground.Repo.Migrations.AddEmbeddedSchemaFieldsToReservation do
  use Ecto.Migration

  def change do
    alter table(:reservations) do
      add(:contact_info, :map)
      add(:attendees, {:array, :map})
      add(:rv_details, :map)
      add(:tent_details, :map)
      add(:final_remarks, :map)
    end
  end
end
