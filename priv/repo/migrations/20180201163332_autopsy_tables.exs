defmodule Autopsy.Repo.Migrations.AutopsyTables do
  use Ecto.Migration

  def change do
    create table(:postmortems) do
      add(:title, :string, null: false)
      add(:summary, :text)
      add(:start_time, :utc_datetime, null: false)
      add(:end_time, :utc_datetime)
      add(:detect_time, :utc_datetime, null: false)
      add(:severity, :integer, null: false)
      add(:gcal, :text)
      add(:deleted, :boolean)
      add(:incident_details, :map)

      timestamps()
    end

    create table(:images) do
      add(:image_link, :text)
      add(:deleted, :boolean)
      add(:postmortem_id, references(:postmortems))
      timestamps()
    end

    create table(:tags) do
      add(:title, :string)
      add(:deleted, :boolean)

      timestamps()
    end

    create table(:postmortem_referenced_tags) do
      add(:postmortem_id, references(:postmortems))
      add(:tag_id, references(:tags))
      add(:deleted, :boolean)

      timestamps()
    end

    create table(:divisions) do
      add(:division_name, :string, null: false)
    end

    create table(:division_fields) do
      add(:division_id, references(:divisions), null: false)
      add(:field_definitions, :map)
    end
  end
end