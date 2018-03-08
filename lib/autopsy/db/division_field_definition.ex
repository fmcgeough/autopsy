defmodule Autopsy.DivisionFieldDefinition do
  @moduledoc """
    Define the "division_field_definitions" table schema

    Each row stores a map defining what it is that a
    particular division wishes to capture in a PostMortem.

    The format of the map is:

    %{division_field_definitions: [%{
      id: "what-happened",
      title: "What Happened?",
      "type: "text",
      order: 1
      }]
    }

    id: the HTML id of the field that appears and the id used to store the data when
        a post mortem is modified. See PostMortem.incident_details
    title: the HTML label/title of the field
    type: "text" (only) right now. we will define a select type down the line.
    order: what order this field should appear in the UI. This is after all the
           fixed fields. If two orders match the order they appear is arbitrary.
  """
  use Ecto.Schema
  alias Autopsy.Division

  schema("division_field_definitions") do
    field(:field_definitions, :map)

    belongs_to(:division, Division)

    timestamps()
  end
end