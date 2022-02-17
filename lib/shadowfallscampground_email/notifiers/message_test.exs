defmodule ShadowfallscampgroundWeb.Notifiers.MessageTest do
  @moduledoc false
  use ExUnit.Case, async: true

  import ShadowfallscampgroundEmail.EmailsView,
    only: [
      get_template: 1,
      get_layout: 1,
      fetch_system_sender_email: 0
    ]

  alias ShadowfallscampgroundEmail.Notifiers

  defp set_system_email(_context) do
    Application.put_env(:shadowfallscampground, ShadowfallscampgroundEmail.Mailer,
      username: "test@test.com"
    )
  end

  defp craft_message_receipt_email(_context) do
    submitter = %{name: Faker.Person.name(), email: Faker.Internet.email()}
    message = Faker.Lorem.sentence()

    email_struct = Notifiers.Message.receipt(submitter, message)

    sender = fetch_system_sender_email()

    %{
      submitter: submitter,
      email_struct: email_struct,
      sender: sender,
      message: message
    }
  end

  defp craft_message_submission_email(_context) do
    submitter = %{name: Faker.Person.name(), email: Faker.Internet.email()}
    message = Faker.Lorem.sentence()

    email_struct = Notifiers.Message.message(submitter, message)

    system_email = fetch_system_sender_email()

    %{
      submitter: submitter,
      email_struct: email_struct,
      system_email: system_email,
      message: message
    }
  end

  describe "Message Receipt" do
    setup [:set_system_email, :craft_message_receipt_email]

    test "should use the base layout", %{email_struct: email_struct} do
      assert get_layout(email_struct) == :base
    end

    test "should use the message receipt template", %{email_struct: email_struct} do
      assert get_template(email_struct) =~ "message_receipt"
    end

    test "should contain the proper subject", %{email_struct: email_struct} do
      assert email_struct.subject == "Message Receipt"
    end

    test "should be from the proper sender", %{email_struct: email_struct, sender: sender} do
      {_, from_email} = email_struct.from
      assert from_email == sender
    end

    test "should be to the proper recipient", %{email_struct: email_struct, submitter: submitter} do
      [{name, email}] = email_struct.to
      assert name == submitter.name
      assert email == submitter.email
    end
  end

  describe "Message Receipt (HTML)" do
    setup [:set_system_email, :craft_message_receipt_email]

    test "should contain the base layout container", %{email_struct: email_struct} do
      assert email_struct.html_body =~ ~s/class="base-layout-container"/
    end

    test "should contain the proper template container", %{email_struct: email_struct} do
      assert email_struct.html_body =~ ~s/class="message-reciept-template-container"/
    end

    test "should contain the message", %{email_struct: email_struct, message: message} do
      assert email_struct.html_body =~ message
    end
  end

  describe "Message Receipt (Text)" do
    setup [:set_system_email, :craft_message_receipt_email]

    test "should contain the base layout", %{email_struct: email_struct} do
      assert email_struct.text_body =~ "Shadow Falls Campground"
    end

    test "should contain the proper template", %{email_struct: email_struct} do
      assert email_struct.text_body =~ "Message Receipt"
    end

    test "should contain the message", %{email_struct: email_struct, message: message} do
      assert email_struct.text_body =~ message
    end
  end

  describe "Message Submission" do
    setup [:set_system_email, :craft_message_submission_email]

    test "should use the base layout", %{email_struct: email_struct} do
      assert get_layout(email_struct) == :base
    end

    test "should use the message inquiry template", %{email_struct: email_struct} do
      assert get_template(email_struct) =~ "message_inquiry"
    end

    test "should contain the proper subject", %{email_struct: email_struct} do
      assert email_struct.subject == "General Inquiry"
    end

    test "should be from the proper sender", %{email_struct: email_struct, submitter: submitter} do
      {name, email} = email_struct.from
      assert name == submitter.name
      assert email == submitter.email
    end

    test "should be to the proper recipient", %{
      email_struct: email_struct,
      system_email: system_email
    } do
      [{_, to_email}] = email_struct.to
      assert to_email == system_email
    end
  end

  describe "Message Submission (HTML)" do
    setup [:set_system_email, :craft_message_submission_email]

    test "should contain the base layout container", %{email_struct: email_struct} do
      assert email_struct.html_body =~ ~s/class="base-layout-container"/
    end

    test "should contain the proper template container", %{email_struct: email_struct} do
      assert email_struct.html_body =~ ~s/class="message-submission-template-container"/
    end

    test "should contain the message", %{email_struct: email_struct, message: message} do
      assert email_struct.html_body =~ message
    end
  end

  describe "Message Submission (Text)" do
    setup [:set_system_email, :craft_message_submission_email]

    test "should contain the base layout", %{email_struct: email_struct} do
      assert email_struct.text_body =~ "Shadow Falls Campground"
    end

    test "should contain the proper template", %{email_struct: email_struct} do
      assert email_struct.text_body =~ "General Inquiry"
    end

    test "should contain the message", %{email_struct: email_struct, message: message} do
      assert email_struct.text_body =~ message
    end
  end
end
