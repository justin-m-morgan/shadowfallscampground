defmodule Shadowfallscampground.Repo.Migrations.CreateInquiries do
  use Ecto.Migration

  def change do
    create table(:inquiries) do
      add :name, :string
      add :email, :string
      add :message, :text

      timestamps()
    end
  end
end
