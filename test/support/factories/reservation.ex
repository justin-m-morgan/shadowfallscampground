defmodule Shadowfallscampground.Factories.ReservationFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      alias Shadowfallscampground.Requests.{Reservation, RvDetails}

      def reservation_params_factory do
        %{
          "arrival" => fake_datetime(hour: 15),
          "departure" => fake_datetime(hour: 11),
          "type_of_request" => Enum.random(["tent", "rv"])
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

      def tent_details_params_factory do
        %{
          number_of_tents: Faker.Random.Elixir.random_between(1, 4),
          power_requested: Enum.random([true, false])
        }
      end

      def rv_details_params_factory do
        %{
          length_of_unit: Faker.Random.Elixir.random_between(0, 5) * 6 + 15,
          type_of_unit: Enum.random(Ecto.Enum.values(RvDetails, :type_of_unit)),
          power_requested: Enum.random([true, false])
        }
      end

      def final_remarks_params_factory do
        %{
          remarks: Faker.Lorem.sentence()
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
