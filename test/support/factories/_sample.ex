defmodule Shadowfallscampground.Factories.SampleFactory do
  defmacro __using__(_opts) do
    quote do
      def sample_factory do
        %{
          title: "My awesome article!",
          body: "Still working on it!"
        }
      end
    end
  end
end
