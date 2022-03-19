defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.Submission do
  @moduledoc """
  Aggregation schema for complete reservation with component schemas
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  embedded_schema do
    embeds_one :basic_details, Steps.BasicDetails
    embeds_one :contact_info, Steps.ContactInfo
    embeds_one :final_remarks, Steps.FinalRemarks
    embeds_one :attendees, Steps.Attendees
    embeds_one :rv_details, Steps.RvDetails
    embeds_one :tent_details, Steps.TentingDetails
  end

  @doc false
  def changeset(), do: changeset(%__MODULE__{}, %{})

  def changeset(submission \\ %__MODULE__{}, attrs) do
    submission
    |> cast(attrs, [])
    |> put_embed(:basic_details, Map.get(attrs, :basic_details))
    |> put_embed(:contact_info, Map.get(attrs, :contact_info))
    |> put_embed(:final_remarks, Map.get(attrs, :final_remarks))
    |> put_embed(:attendees, Map.get(attrs, :attendees))
    |> put_either_tenting_or_rv_details(attrs)
  end

  defp put_either_tenting_or_rv_details(changeset, %{basic_details: basic_details} = attrs) do
    case basic_details.type_of_request do
      :tent -> put_embed(changeset, :tent_details, Map.get(attrs, :tent_details))
      :rv -> put_embed(changeset, :rv_details, Map.get(attrs, :rv_details))
      _ -> changeset
    end
  end

  def reservation_adapter(submission \\ %__MODULE__{}) do
    submission
  end
end
