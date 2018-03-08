defmodule Autopsy.AutopsyDb do
  @moduledoc """
    API for Autopsy db access.
  """
  import Ecto.{Query, Changeset}, warn: false
  alias Autopsy.{Repo}
  alias Autopsy.{Division, DivisionFieldDefinition}

  @doc """
    Return divisions setup in the database.
  """
  def list_divisions do
    division_base_query() |> Repo.all()
  end

  @doc """
    Create a Division row in db.

  ## Examples
      iex> create_division(%{field: value})
      {:ok, %Division{}}
  """
  def create_division(attrs \\ %{}) do
    %Division{}
    |> division_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Create a DivisionFieldDefinition row in db.

  ## Examples
      iex> create_division_field_definition(%{field: value})
      {:ok, %DivisionFieldDefinition{}}
  """
  def create_division_field_definition(attrs \\ %{}) do
    %DivisionFieldDefinition{}
    |> division_field_definition_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Return the Division uniquely identified by a name.

    Returns nil if no result was found. Raises if more than one entry.
  """
  def get_division_by_name(name) do
    from(d in division_base_query(), where: d.division_name == ^name)
    |> Repo.one()
  end

  defp division_changeset(%Division{} = division, attrs) do
    division
    |> cast(attrs, [:division_name])
    |> validate_required([:division_name])
  end

  defp division_field_definition_changeset(
         %DivisionFieldDefinition{} = division_field_definition,
         attrs
       ) do
    division_field_definition
    |> cast(attrs, [:field_definitions, :division_id])
    |> validate_required([:field_definitions, :division_id])
  end

  defp division_base_query do
    from(
      d in Division,
      left_join: f in assoc(d, :division_field_definition),
      preload: [division_field_definition: d]
    )
  end
end