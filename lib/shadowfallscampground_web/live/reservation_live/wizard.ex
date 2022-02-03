defmodule ShadowfallscampgroundWeb.ReservationLive.Wizard do
  @moduledoc """
  A form step wizard
  """
  use ShadowfallscampgroundWeb, :live_component

  @doc "Manages the current stage of the form"
  data current_step, :integer, default: 0

  slot steps

  def render(assigns) do
    ~F"""
    <div>
      <div class="grid">
        {#for {_step, index} <- Enum.with_index(@steps)}
          <div class={
            "col-start-1 row-start-1",
            "transition duration-1000 delay-500",
            "transform",
            "#{hide?(index, @current_step)}"
          }>
            <#slot name="steps" index={index} />
          </div>
        {/for}
      </div>

      <button :on-click="dec">Step backward</button>
      <button :on-click="inc">Step forward</button>
    </div>
    """
  end

  def update(%{command: :forward_step}, socket) do
    socket
    |> maybe_increment_step()
    |> assign(command: nil)
    |> then(&{:ok, &1})
  end

  def update(%{command: :backward_step}, socket) do
    socket
    |> maybe_decrement_step()
    |> assign(command: nil)
    |> then(&{:ok, &1})
  end

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def handle_event("inc", _, socket) do
    socket
    |> maybe_increment_step()
    |> then(&{:noreply, &1})
  end

  def handle_event("dec", _, socket) do
    socket
    |> maybe_decrement_step()
    |> then(&{:noreply, &1})
  end

  defp maybe_increment_step(socket) do
    case socket.assigns.current_step < length(socket.assigns.steps) - 1 do
      true -> update(socket, :current_step, &(&1 + 1))
      false -> socket
    end
  end

  defp maybe_decrement_step(socket) do
    case socket.assigns.current_step > 0 do
      true -> update(socket, :current_step, &(&1 - 1))
      false -> socket
    end
  end

  defp hide?(index, current_step) when index == current_step,
    do: "opacity-100"

  defp hide?(index, current_step) when index < current_step,
    do: "opacity-0 -translate-x-full"

  defp hide?(_index, _current_step),
    do: "opacity-0 translate-x-full"
end
