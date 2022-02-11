defmodule Shadowfallscampground.MailerTest do
  @moduledoc false
  use ExUnit.Case, async: true

  import Swoosh.TestAssertions

  alias Shadowfallscampground.{Emails, Mailer}

  test "send a sample email" do
    person = %{email: Faker.Internet.email(), name: Faker.Person.name()}

    {:ok, _} =
      person
      |> Emails.Sample.welcome()
      |> Mailer.deliver()

    assert_email_sent(Emails.Sample.welcome(person))
  end
end
