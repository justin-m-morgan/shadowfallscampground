defmodule Shadowfallscampground.Identities do
  @moduledoc """
  The Identities context.
  """

  import Ecto.Query, warn: false
  alias Shadowfallscampground.Repo

  alias Shadowfallscampground.Identities.Camper

  @doc """
  Returns the list of campers.

  ## Examples

      iex> list_campers()
      [%Camper{}, ...]

  """
  def list_campers do
    Repo.all(Camper)
  end

  @doc """
  Gets a single camper.

  Raises `Ecto.NoResultsError` if the Camper does not exist.

  ## Examples

      iex> get_camper!(123)
      %Camper{}

      iex> get_camper!(456)
      ** (Ecto.NoResultsError)

  """
  def get_camper!(id), do: Repo.get!(Camper, id)

  @doc """
  Creates a camper.

  ## Examples

      iex> create_camper(%{field: value})
      {:ok, %Camper{}}

      iex> create_camper(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_camper(attrs \\ %{}) do
    %Camper{}
    |> Camper.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a camper.

  ## Examples

      iex> update_camper(camper, %{field: new_value})
      {:ok, %Camper{}}

      iex> update_camper(camper, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_camper(%Camper{} = camper, attrs) do
    camper
    |> Camper.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a camper.

  ## Examples

      iex> delete_camper(camper)
      {:ok, %Camper{}}

      iex> delete_camper(camper)
      {:error, %Ecto.Changeset{}}

  """
  def delete_camper(%Camper{} = camper) do
    Repo.delete(camper)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking camper changes.

  ## Examples

      iex> change_camper(camper)
      %Ecto.Changeset{data: %Camper{}}

  """
  def change_camper(%Camper{} = camper, attrs \\ %{}) do
    Camper.changeset(camper, attrs)
  end
end
