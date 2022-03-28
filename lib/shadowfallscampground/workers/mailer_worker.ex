defmodule Shadowfallscampground.Workers.MailerWorker do
  @moduledoc """
  Worker for sending emails as background tasks
  """
  require Logger

  use Oban.Worker, queue: :emails, max_attempts: 2

  alias ShadowfallscampgroundEmail.{Mailer, Notifiers}
  alias Shadowfallscampground.Requests.Reservation

  @doc """
  Public API for generating composite inquiry submission and receipt emails
  """
  def mail_inquiry_submission_and_receipt(args) do
    Logger.info("Creating Inquiry jobs")

    [
      __MODULE__.new(Map.put(args, "type", "inquiry_submission")),
      __MODULE__.new(Map.put(args, "type", "inquiry_receipt"), schedule_in: 5)
    ]
    |> Oban.insert_all()
  end

  @doc """
  Public API for generating composite reservation submission and receipt emails
  """
  def mail_reservation_submission_and_receipt(reservation = %Reservation{}) do
    reservation_map = Reservation.coerce_reservation_to_map(reservation)

    [
      __MODULE__.new(Map.put(reservation_map, :type, :reservation_submission)),
      __MODULE__.new(Map.put(reservation_map, :type, :reservation_receipt), schedule_in: 5)
    ]
    |> Oban.insert_all()
  end

  @doc """
  Low level callbacks for Oban to genereate jobs
  """
  @impl Oban.Worker
  def perform(%{args: %{"type" => "inquiry_receipt"} = args}) do
    args
    |> Notifiers.Inquiry.receipt()
    |> attempt_mail_delivery()
  end

  def perform(%{args: %{"type" => "inquiry_submission"} = args}) do
    args
    |> Notifiers.Inquiry.message()
    |> attempt_mail_delivery()
  end

  def perform(%{args: %{"type" => "reservation_receipt"} = args}) do
    args
    |> Notifiers.Reservation.receipt()
    |> attempt_mail_delivery()
  end

  def perform(%{args: %{"type" => "reservation_submission"} = args}) do
    args
    |> Notifiers.Reservation.message()
    |> attempt_mail_delivery()
  end

  defp attempt_mail_delivery(email) do
    Logger.info("Attempting mail")

    case Mailer.deliver(email) do
      {:ok, _} ->
        :ok
        |> tap(fn _ -> Logger.info("Message sent successfully") end)

      {:error, error} ->
        {:error, error}
        |> tap(fn {_, error} ->
          Logger.error("Message failed to send: #{error.message}")
        end)
    end
  end
end
