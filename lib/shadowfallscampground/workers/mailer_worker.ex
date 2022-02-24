defmodule Shadowfallscampground.Workers.MailerWorker do
  @moduledoc """
  Worker for sending emails as background tasks
  """

  use Oban.Worker, queue: :emails, max_attempts: 5

  alias ShadowfallscampgroundEmail.{Mailer, Notifiers}

  @doc """
  Low level callbacks for Oban to genereate jobs
  """
  @impl Oban.Worker
  def perform(%{args: %{"type" => "inquiry_receipt"} = args}) do
    args
    |> Notifiers.Message.receipt()
    |> attempt_mail_delivery()
  end

  def perform(%{args: %{"type" => "inquiry_submission"} = args}) do
    args
    |> Notifiers.Message.message()
    |> attempt_mail_delivery()
  end

  @doc """
  Public API for generating both required tasks
  """
  def mail_inquiry_submission_and_receipt(args) do
    [
      __MODULE__.new(Map.put(args, "type", "inquiry_submission")),
      __MODULE__.new(Map.put(args, "type", "inquiry_receipt"), schedule_in: 2)
    ]
    |> Oban.insert_all()
  end

  defp attempt_mail_delivery(email) do
    case Mailer.deliver(email) do
      {:ok, _} -> :ok
      {:error, error} -> {:error, error}
    end
  end
end
