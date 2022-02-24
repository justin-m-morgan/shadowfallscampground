defmodule Shadowfallscampground.Workers.MailerWorkerTest do
  use Shadowfallscampground.DataCase

  import Shadowfallscampground.Factories.Factory
  # import Swoosh.TestAssertions

  alias Shadowfallscampground.Workers.MailerWorker

  describe "Mailer Worker - " do
    setup do
      args =
        %{"type" => "inquiry_receipt"}
        |> Map.merge(build(:mailer_contact))
        |> Map.merge(build(:mailer_message))

      %{args: args}
    end

    test "should enqueue an inquiry_receipt job", %{args: args} do
      args = Map.put(args, "type", "inquiry_receipt")

      args
      |> MailerWorker.new()
      |> Oban.insert()

      assert_enqueued(worker: MailerWorker, args: args)
      # assert_email_sent(fn email -> email.subject =~ "Receipt" end)
    end

    test "should enqueue an inquiry_submission job", %{args: args} do
      args = Map.put(args, "type", "inquiry_submission")

      args
      |> MailerWorker.new()
      |> Oban.insert()

      assert_enqueued(worker: MailerWorker, args: args)
      # assert_email_sent(fn email -> email.subject =~ "General Inquiry" end)
    end
  end

  describe "Submitting an inquiry" do
    setup do
      args =
        build(:mailer_contact)
        |> Map.merge(build(:mailer_message))

      %{args: args}
    end

    test "should queue both a submission and receipt task", %{args: args} do
      MailerWorker.mail_inquiry_submission_and_receipt(args)

      assert_enqueued(worker: MailerWorker, args: Map.put(args, "type", "inquiry_submission"))
      assert_enqueued(worker: MailerWorker, args: Map.put(args, "type", "inquiry_receipt"))
      assert %{success: 2} = Oban.drain_queue(queue: :emails, with_scheduled: true)
    end
  end
end
