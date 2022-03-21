defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.StepContainer do
  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.Requests
  alias Shadowfallscampground.Requests.Reservation

  data reservation_params, :map
  data changeset, :map

  slot default,
    required: true,
    args: [:changeset]

  def render(assigns) do
    ~F"""
    <div class="grid gap-4 py-8">
      <#slot :args={changeset: @changeset} />
    </div>
    """
  end

  def mount(socket) do
    socket
    |> assign(:reservation_params, initial_form_params())
    |> update_changeset()
    |> then(&{:ok, &1})
  end

  def update(%{payload: %{event: :submit_form}}, socket) do
    error_msg = "Oops, something went wrong. Please try submitting again after a few seconds."

    case Requests.create_reservation(socket.assigns.changeset) do
      {:ok, _reservation} ->
        socket
        |> tap(fn _ -> send(self(), :successful_submission) end)
        |> then(&{:ok, &1})

      {:error, _changeset} ->
        socket
        |> tap(fn _ -> send(self(), {:put_flash, :error, error_msg}) end)
        |> then(&{:ok, &1})
    end
  end

  def update(%{payload: payload} = assigns, socket) do
    socket
    |> assign(assigns)
    |> apply_changes(payload)
    |> update_changeset()
    |> tap(&IO.inspect(&1.assigns.changeset, label: "Update"))
    |> then(&{:ok, &1})
  end

  def update(assigns, socket), do: {:ok, assign(socket, assigns)}

  defp apply_changes(socket, %{"reservation" => new_reservation_params}) do
    assign(
      socket,
      :reservation_params,
      Map.merge(socket.assigns.reservation_params, new_reservation_params)
    )
  end

  defp apply_changes(socket, payload) do
    assign(socket, :reservation_params, Map.merge(socket.assigns.reservation_params, payload))
  end

  defp update_changeset(socket),
    do: assign(socket, :changeset, Reservation.changeset(socket.assigns.reservation_params))

  defp initial_form_params() do
    %{
      "contact_info" => nil,
      "attendees" => nil,
      "tent_details" => nil,
      "rv_details" => nil,
      "final_remarks" => nil
    }
  end

  @doc """
  For consumption by other compenents to send messages to this component
  """
  def send_changeset_to_step_manager(
        manager_id \\ "reservation_form_step_container",
        payload
      ) do
    send_update(__MODULE__, id: manager_id, payload: payload)
  end
end
