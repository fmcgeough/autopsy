defmodule Autopsy.SeverityDefinition do
  alias __MODULE__
  @severity_range 1..10

  defstruct [:value, :description]

  def new(value, description) when value in @severity_range do
    {:ok, %SeverityDefinition{value: value, description: description}}
  end

  def new(_value, _description), do: {:error, :invalid_value}
end
