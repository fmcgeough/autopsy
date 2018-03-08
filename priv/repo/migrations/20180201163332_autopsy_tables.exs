defmodule Autopsy.Repo.Migrations.AutopsyTables do
  use Ecto.Migration

  def change do
    create table("post_mortems") do
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

    create table("images") do
      add(:image_link, :text)
      add(:deleted, :boolean)
      add(:post_mortem_id, references(:post_mortems, on_delete: :delete_all), null: false)
      timestamps()
    end

    create table(:tags) do
      add(:title, :string, null: false)
      add(:deleted, :boolean)

      timestamps()
    end

    create table(:post_mortem_tags) do
      add(:post_mortem_id, references(:post_mortems, on_delete: :delete_all), null: false)
      add(:tag_id, references(:tags, on_delete: :delete_all), null: false)
      add(:deleted, :boolean)

      timestamps()
    end

    create table(:divisions) do
      add(:division_name, :string, null: false)

      timestamps()
    end

    create table(:division_field_definitions) do
      add(:division_id, references(:divisions, on_delete: :delete_all), null: false)
      add(:field_definitions, :map)

      timestamps()
    end
  end
end