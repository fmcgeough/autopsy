defmodule Autopsy.DivisionFieldDefinition do
  use Ecto.Schema
  alias Autopsy.Division

  schema("division_field_definitions") do
    field(:field_definitions, :map)

    belongs_to(:division, Division)
  end
end