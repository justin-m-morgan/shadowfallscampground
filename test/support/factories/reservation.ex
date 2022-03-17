defmodule Shadowfallscampground.Factories.ReservationFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      alias Shadowfallscampground.Requests.Reservation

      def reservation_params_factory do
        %{
          arrival: fake_datetime(hour: 15),
          departure: fake_datetime(hour: 11),
          type_of_request: Enum.random(["tent", "rv"])
        }
      end

      def reservation_form_params_factory do
        %{
          arrival: fake_datetime(hour: 15) |> date_to_components(),
          departure: fake_datetime(hour: 11) |> date_to_components(),
          type_of_request: Enum.random(["tent", "rv"])
        }
      end

      def reservation_factory do
        %Reservation{
          arrival: fake_datetime(hour: 15),
          departure: fake_datetime(hour: 11),
          type_of_request: Enum.random([:rv, :tent])
        }
      end

      def fake_datetime(opts) do
        earliest = opts[:earliest] || ~D[2022-05-15]
        latest = opts[:latest] || ~D[2022-09-15]
        hour = opts[:hour] || 11
        time = Time.new!(hour, 0, 0)

        Faker.Date.between(earliest, latest)
        |> NaiveDateTime.new!(time)
      end

      defp date_to_components(date) do
        %{
          day: date.day,
          month: date.month
        }
      end
    end
  end
end
