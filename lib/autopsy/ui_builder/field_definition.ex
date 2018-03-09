defmodule Autopsy.FieldDefinition do
  alias __MODULE__
  @types ["text"]

  defstruct [:id, :title, :type, :order, :enabled]

  def new(id, title, type, order, enabled) when type in @types and order > 0 do
    {:ok, %FieldDefinition{id: id, title: title, type: type, order: order, enabled: enabled}}
  end

  def new(_id, _title, _type, _order, _enabled) do
    {:error, :invalid_type}
  end
end
