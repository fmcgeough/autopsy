defmodule Autopsy.Division do
  @moduledoc """
  Define the "divisions" table schema.

  A division has a unique name and defines the variable
  part of the postmortem UI. An Autopsy system can be
  built with a single division if there is only one type
  of postmortem for a company.

    The ui_definitions map contains the following keys:

    * field_definitions
    * severity_definitions

    The field_definitions value consists of an array of structures
    defining what option fields appear on the UI.

    %{field_definitions: [%{
      id: "what-happened",
      title: "What Happened?",
      type: "text",
      order: 1,
      enabled: true
      }]
    }

    id: the HTML id of the field that appears and the id used to store the data when
        a post mortem is modified. See PostMortem.incident_details
    title: the HTML label/title of the field
    type: "text" (only) right now. we will define a select type down the line.
    order: what order this field should appear in the UI. This is after all the
           fixed fields. If two orders match the order they appear is arbitrary.
    enabled: true or false. Indicates whether we should consider this field definition.

    The severity_definitions value contains the definition of the meaning
    of severity levels assigned to a postmortem.

    %{severity_definitions: [%{
      "value" => 1,
      "description" => "P1 (Critical) - A complete loss or serious impairment..."
      }]
    }

  """
  use Ecto.Schema
  alias Autopsy.{PostMortem, Tag}

  schema("divisions") do
    field(:division_name, :string)
    field(:ui_definitions, :map)

    timestamps()

    has_many(:post_mortems, PostMortem)
    has_many(:tags, Tag)
  end
end