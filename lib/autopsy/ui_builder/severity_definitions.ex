defmodule Autopsy.SeverityDefinitions do
  def new(), do: %{}

  def add_definition(severity_definition, definition) do
    Map.put(severity_definition, definition.value, definition)
  end
end
