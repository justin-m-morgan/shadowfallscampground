defmodule Shadowfallscampground.CamperFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      alias Shadowfallscampground.Identities.Camper

      def camper_factory do
        %Camper{
          email: Faker.Internet.email(),
          name: Faker.Person.name()
        }
      end

      def camper_params_factory do
        %{
          email: Faker.Internet.email(),
          name: Faker.Person.name()
        }
      end
    end
  end
end
