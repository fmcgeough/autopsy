defmodule Autopsy.AutopsyDb do
  @moduledoc """
    API for Autopsy db access.
  """
  import Ecto.{Query, Changeset}, warn: false
  alias Autopsy.{Repo}
  alias Autopsy.{Division, Tag, PostMortemTag, PostMortem}

  def list_post_mortems_for_division(id) do
    from(p in post_mortem_base_query(), where: p.division_id == ^id)
    |> Repo.all()
  end

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
    Return the Division uniquely identified by a name.

    Returns nil if no result was found. Raises if more than one entry.
  """
  def get_division_by_name(name) do
    from(d in division_base_query(), where: d.division_name == ^name)
    |> Repo.one()
  end

  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> tag_changeset(attrs)
    |> Repo.insert()
  end

  def create_post_mortem_tag(attrs \\ %{}) do
    %PostMortemTag{}
    |> post_mortem_tag_changeset(attrs)
    |> Repo.insert()
  end

  defp division_changeset(%Division{} = division, attrs) do
    division
    |> cast(attrs, [:division_name, :ui_definitions])
    |> validate_required([:division_name, :ui_definitions])
  end

  defp tag_changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:title, :deleted, :division_id])
    |> validate_required([:title, :division_id])
  end

  defp post_mortem_tag_changeset(%PostMortemTag{} = post_mortem_tag, attrs) do
    post_mortem_tag
    |> cast(attrs, [:post_mortem_id, :tag_id])
    |> validate_required([:post_mortem_id, :tag_id])
  end

  defp division_base_query do
    from(d in Division, left_join: t in assoc(d, :tags))
  end

  defp post_mortem_base_query do
    from(
      p in PostMortem,
      join: division in assoc(p, :division),
      left_join: images in assoc(p, :images),
      left_join: post_mortem_tags in assoc(p, :post_mortem_tags),
      left_join: tag in assoc(post_mortem_tags, :tag),
      preload: [
        division: division,
        images: images,
        post_mortem_tags: {post_mortem_tags, tag: tag}
      ]
    )
  end
end