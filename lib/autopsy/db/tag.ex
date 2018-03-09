defmodule Autopsy.Tag do
  use Ecto.Schema
  alias Autopsy.{Division, PostMortemTag}

  schema("tags") do
    field(:title, :string)
    field(:deleted, :boolean)

    timestamps()

    belongs_to(:division, Division)
    has_many(:post_mortem_tags, PostMortemTag)
  end
end