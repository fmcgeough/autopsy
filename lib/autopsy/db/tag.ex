defmodule Autopsy.Tag do
  use Ecto.Schema

  schema("tags") do
    field(:title, :string)
    field(:deleted, :boolean)

    timestamps()
  end
end