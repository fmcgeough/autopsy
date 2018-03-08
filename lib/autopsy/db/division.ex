defmodule Autopsy.Division do
  @moduledoc """
  Define the "divisions" table schema
  """
  use Ecto.Schema
  alias Autopsy.DivisionFieldDefinition

  schema("divisions") do
    field(:division_name, :string)

    timestamps()

    has_one(:division_field_definition, DivisionFieldDefinition)
  end
end