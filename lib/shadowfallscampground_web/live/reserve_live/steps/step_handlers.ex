defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.StepHandler do
  @moduledoc """
  Generalized handlers for form step components
  """
  use ShadowfallscampgroundWeb, :live_component

  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop base_struct, :struct, required: true

  prop changeset_fn, :fun, required: true

  prop title, :string, required: true

  prop data_test, :string, required: true

  data changeset, :struct

  slot default, required: true, args: [:changeset]

  def render(assigns) do
    ~F"""
    <div>
      <Forms.Form
        changeset={@changeset}
        change="validate"
        submit="save"
        title={@title}
        data_test={@data_test}
      >
        <#slot :args={changeset: @changeset} />
      </Forms.Form>
    </div>
    """
  end

  @impl true
  def update(assigns, socket) do
    changeset = Ecto.Changeset.change(assigns.base_struct)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  # def handle_validation(params, changeset_fn, socket) do
  @impl true
  def handle_event("validate", payload, socket) do
    params = extract_payload(payload)

    IO.inspect(params)

    changeset =
      socket.assigns.base_struct
      |> socket.assigns.changeset_fn.(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  # def handle_save(params, socket) do
  @impl true
  def handle_event("save", payload, socket) do
    params = extract_payload(payload)

    save_params(socket, :new, params)
  end

  defp save_params(socket, :new, _params) do
    {:noreply, socket}
  end

  defp extract_payload(%{"contact_info" => params}), do: params
  defp extract_payload(%{"basic_details" => params}), do: params
  defp extract_payload(%{"tenting_details" => params}), do: params
  defp extract_payload(%{"rv_details" => params}), do: params
  defp extract_payload(%{"attendees" => params}), do: params
end
