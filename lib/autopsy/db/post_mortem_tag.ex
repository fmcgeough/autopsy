defmodule Autopsy.PostMortemTag do
  @moduledoc """
  Define the "post_mortem_tags" table schema
  """
  use Ecto.Schema
  alias Autopsy.{PostMortem, Tag}

  schema("post_mortem_tags") do
    timestamps()

    field(:deleted, :boolean)
    belongs_to(:post_mortem, PostMortem)
    belongs_to(:tag, Tag)
  end
end