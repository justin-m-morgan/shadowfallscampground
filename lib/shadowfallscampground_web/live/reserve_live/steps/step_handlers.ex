defmodule ShadowfallscampgroundWeb.ReserveLive.Steps.StepHandler do
  @moduledoc """
  Generalized handlers for form step components
  """
  use ShadowfallscampgroundWeb, :live_component

  alias ShadowfallscampgroundWeb.Forms
  alias ShadowfallscampgroundWeb.ReserveLive.Steps

  prop changeset, :struct, required: true

  prop title, :string, required: true

  prop data_test, :string, required: true

  # data changeset, :struct

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

  # def handle_validation(params, changeset_fn, socket) do
  @impl true
  def handle_event("validate", payload, socket) do
    Steps.StepContainer.send_changeset_to_step_manager(payload)

    # {:noreply, assign(socket, :changeset, changeset)}
    {:noreply, socket}
  end

  # def handle_save(params, socket) do
  @impl true
  def handle_event("save", payload, socket) do
    save_params(socket, :new, payload)
  end

  defp save_params(socket, :new, _params) do
    {:noreply, socket}
  end
end
