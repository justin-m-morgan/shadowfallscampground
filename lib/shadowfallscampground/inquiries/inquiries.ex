defmodule Shadowfallscampground.Inquiries do
  @moduledoc """
  The Inquiries context.
  """

  import Ecto.Query, warn: false
  alias Shadowfallscampground.Repo

  alias Shadowfallscampground.Inquiries.Inquiry

  @doc """
  Returns the list of inquiries.

  ## Examples

      iex> list_inquiries()
      [%Inquiry{}, ...]

  """
  def list_inquiries do
    Repo.all(Inquiry)
  end

  @doc """
  Gets a single inquiry.

  Raises `Ecto.NoResultsError` if the Inquiry does not exist.

  ## Examples

      iex> get_inquiry!(123)
      %Inquiry{}

      iex> get_inquiry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inquiry!(id), do: Repo.get!(Inquiry, id)

  @doc """
  Creates a inquiry.

  ## Examples

      iex> create_inquiry(%{field: value})
      {:ok, %Inquiry{}}

      iex> create_inquiry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inquiry(attrs \\ %{}) do
    %Inquiry{}
    |> Inquiry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inquiry.

  ## Examples

      iex> update_inquiry(inquiry, %{field: new_value})
      {:ok, %Inquiry{}}

      iex> update_inquiry(inquiry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inquiry(%Inquiry{} = inquiry, attrs) do
    inquiry
    |> Inquiry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inquiry.

  ## Examples

      iex> delete_inquiry(inquiry)
      {:ok, %Inquiry{}}

      iex> delete_inquiry(inquiry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inquiry(%Inquiry{} = inquiry) do
    Repo.delete(inquiry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inquiry changes.

  ## Examples

      iex> change_inquiry(inquiry)
      %Ecto.Changeset{data: %Inquiry{}}

  """
  def change_inquiry(%Inquiry{} = inquiry, attrs \\ %{}) do
    Inquiry.changeset(inquiry, attrs)
  end
end
