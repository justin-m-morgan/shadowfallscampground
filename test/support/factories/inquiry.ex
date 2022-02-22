defmodule Shadowfallscampground.Factories.InquiryFactory do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      alias Shadowfallscampground.Inquiries.Inquiry

      def inquiry_params_factory() do
        %{
          name: Faker.Person.name(),
          email: Faker.Internet.email(),
          message: Faker.Lorem.sentence()
        }
      end

      def invalid_inquiry_params_factory() do
        %{
          name: nil,
          email: nil,
          message: nil
        }
      end

      def inquiry_factory() do
        %Inquiry{
          name: Faker.Person.name(),
          email: Faker.Internet.email(),
          message: Faker.Lorem.sentence()
        }
      end
    end
  end
end
