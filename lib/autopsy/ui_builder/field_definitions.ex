defmodule Autopsy.FieldDefinitions do
  alias Autopsy.FieldDefinition

  def new(), do: %{}

  def add_definition(field_definitions, %FieldDefinition{} = definition) do
    field_definitions
    |> Enum.find(fn val -> val.order == definition.order end)
    |> case do
      nil -> Map.put(field_definitions, definition.id, definition)
      _ -> {:error, :matching_order}
    end
  end
end
