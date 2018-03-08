defmodule Autopsy.Image do
  @moduledoc """
  Define the "images" table schema
  """
  use Ecto.Schema
  alias Autopsy.PostMortem

  schema("images") do
    field(:image_link, :string)
    field(:deleted, :boolean)

    timestamps()

    belongs_to(:post_mortem, PostMortem)
  end
end