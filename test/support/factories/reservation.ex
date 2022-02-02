defmodule Shadowfallscampground.ReservationFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      alias Shadowfallscampground.Requests.{Reservation, RvDetails, TentDetails}

      def reservation_factory do
        arrival_date = Faker.Date.between(~D[2022-05-15], ~D[2022-09-15])
        departure_date = Date.add(arrival_date, Enum.random(1..30))

        %Reservation{
          arrival: arrival_date,
          departure: departure_date,
          type_of_request: type_of_request()
        }
      end

      def reservation_params_factory do
        arrival_date = Faker.Date.between(~D[2022-05-15], ~D[2022-09-15])
        departure_date = Date.add(arrival_date, Enum.random(1..30))

        %{
          arrival: arrival_date,
          departure: departure_date,
          type_of_request: type_of_request()
        }
      end

      def tent_details_factory do
        %{
          number_of_people: Faker.random_between(1, 10),
          number_of_tents: Faker.random_between(1, 3),
          power_requested: Enum.random([true, false])
        }
      end

      def rv_details_factory do
        %{
          number_of_people: Faker.random_between(1, 10),
          length_of_unit: Faker.random_between(12, 40),
          type_of_unit: type_of_unit(),
          sewer_required: Enum.random([true, false])
        }
      end

      defp type_of_request() do
        Reservation
        |> Ecto.Enum.values(:type_of_request)
        |> Enum.random()
        |> Atom.to_string()
      end

      defp type_of_unit() do
        RvDetails
        |> Ecto.Enum.values(:type_of_unit)
        |> Enum.random()
        |> Atom.to_string()
      end
    end
  end
end
