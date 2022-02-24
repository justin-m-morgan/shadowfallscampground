defmodule Shadowfallscampground.Factories.MailerJobFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      def mailer_contact_factory do
        %{
          "email" => Faker.Internet.email(),
          "name" => Faker.Person.name()
        }
      end

      def mailer_message_factory do
        %{
          "message" => Faker.Lorem.sentence()
        }
      end
    end
  end
end
