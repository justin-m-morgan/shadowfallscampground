defmodule Shadowfallscampground.Workers.SampleWorker do
  use Oban.Worker, queue: :default

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id}}) do
    cond do
      id < 5 -> IO.inspect("ID is small: #{id}")
      id < 10 -> IO.inspect("ID is medium: #{id}")
      true -> IO.inspect("ID is large: #{id}")
    end

    :ok
  end
end
