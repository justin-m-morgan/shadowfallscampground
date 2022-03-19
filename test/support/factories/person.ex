defmodule Shadowfallscampground.Factories.PersonFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      def person_params_factory do
        %{
          "legal_name" => Faker.Person.name(),
          "preferred_name" => Faker.Person.first_name(),
          "email" => Faker.Internet.email()
        }
      end

      def person_factory do
        %{
          legal_name: Faker.Person.name(),
          preferred_name: Faker.Person.first_name(),
          email: Faker.Internet.email()
        }
      end
    end
  end
end
