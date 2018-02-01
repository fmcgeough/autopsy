defmodule Autopsy.Repo.Migrations.AutopsyTables do
  use Ecto.Migration

  def change do
    create table(:postmortems) do
      add(:title, :string)
      add(:summary, :text)
      add(:why_surprised, :text)
      add(:start_time, :utc_datetime)
      add(:end_time, :utc_datetime)
      add(:status_time, :utc_datetime)
      add(:detect_time, :utc_datetime)
      add(:severity, :integer)
      add(:gcal, :text)
      add(:contact, :string)
      add(:facilitator, :string)
      add(:facilitator_email, :string)
      add(:deleted, :boolean)
      add(:modifier, :string)
      add(:customer_experience, :text)
      add(:number_calls, :text)
      add(:number_cust, :text)
      add(:tech_impact, :text)
      add(:timeline, :text)
      add(:root_cause, :text)
      add(:corrections, :text)
      add(:preventative, :text)
      add(:lessons, :text)
      add(:improvement, :text)

      timestamps()
    end

    create table(:images) do
      add(:image_link, :text)
      add(:deleted, :boolean)
      add(:postmortem_id, references(:postmortems))
      timestamps()
    end

    create table(:postmortem_history) do
      add(:auth_username, :string)
      add(:action, :string)
      add(:summary, :text)
      add(:why_surprised, :text)
      add(:customer_experience, :text)
      add(:tech_impact, :text)
      add(:timeline, :text)
      add(:root_cause, :text)
      add(:corrections, :text)
      add(:preventative, :text)
      add(:lessons, :text)

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
  end
end
