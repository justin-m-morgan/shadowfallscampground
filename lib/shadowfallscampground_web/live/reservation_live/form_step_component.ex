defmodule ShadowfallscampgroundWeb.ReservationLive.FormStepComponent do
  @moduledoc false

  import Phoenix.LiveView, only: [send_update: 2, assign: 2, assign: 3]

  alias ShadowfallscampgroundWeb.ReservationLive.{ReservationContainer, Wizard}

  @doc """
  Checks whether assigns provide a changeset to pre-populate the form with.
  Otherwise, generates a new changeset.
  """
  def update(socket, assigns, base_struct, seed_changeset, changeset_fn) do
    changeset = maybe_prepopulate(changeset_fn, base_struct, seed_changeset)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  defp maybe_prepopulate(_chng_fn, _base_struct, %Ecto.Changeset{} = changeset), do: changeset
  defp maybe_prepopulate(changeset_fn, base_struct, nil), do: changeset_fn.(base_struct)

  def handle_validate_event(socket, base_struct_key, params, changeset_fn) do
    changeset =
      socket.assigns
      |> Map.get(base_struct_key)
      |> changeset_fn.(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_save_event(socket, changeset_key, changeset) do
    container_assigns =
      %{}
      |> Map.put(:id, "reservation-container")
      |> Map.put(changeset_key, changeset)

    send_update(ReservationContainer, container_assigns)

    send_update(Wizard, id: "reservation-wizard", command: :forward_step)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_back_event(socket) do
    send_update(Wizard, id: "reservation-wizard", command: :backward_step)

    {:noreply, socket}
  end
end
