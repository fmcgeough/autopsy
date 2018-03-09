defmodule Autopsy.Division do
  @moduledoc """
  Define the "divisions" table schema
  """
  use Ecto.Schema
  alias Autopsy.{DivisionFieldDefinition, PostMortem}

  schema("divisions") do
    field(:division_name, :string)

    timestamps()

    has_one(:division_field_definition, DivisionFieldDefinition)
    has_many(:post_mortems, PostMortem)
  end
end