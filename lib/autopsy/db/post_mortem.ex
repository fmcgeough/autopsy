defmodule Autopsy.PostMortem do
  @moduledoc """
  Define the "postmortems" table schema
  """
  use Ecto.Schema
  alias Autopsy.{Image, Division}

  schema "postmortems" do
    field(:title, :string)
    field(:summary, :string)
    field(:start_time, :utc_datetime)
    field(:end_time, :utc_datetime)
    field(:detect_time, :utc_datetime)
    field(:severity, :integer)
    field(:gcal, :string)
    field(:deleted, :boolean)
    field(:incident_details, :map)

    timestamps()

    belongs_to(:division, Division)
    has_many(:images, Image)
  end
end