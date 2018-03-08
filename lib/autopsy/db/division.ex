defmodule Autopsy.Division do
  @moduledoc """
  Define the "divisions" table schema
  """
  use Ecto.Schema

  schema("division") do
    field(:division_name, :string)

    timestamps()
  end
end