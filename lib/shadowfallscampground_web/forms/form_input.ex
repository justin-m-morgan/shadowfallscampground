defmodule ShadowfallscampgroundWeb.Forms.FormInput do
  @moduledoc """
  Base component for building input components (container)
  """
  use ShadowfallscampgroundWeb, :component

  alias Surface.Components.Form

  @doc "Field name"
  prop name, :atom, required: true

  @doc "Label text (computed from field name if not provided)"
  prop label, :string

  @doc "Input component"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <Form.Field name={@name}>
      {#if @label}
        <Form.Label class="font-bold text-primary-900">{@label}</Form.Label>
      {#else}
        <Form.Label class="font-bold text-primary-900" />
      {/if}
      <div class="col-span-3">
        <#slot />
      </div>
      <div class="h-4 text-red-600">
        <Form.ErrorTag />
      </div>
    </Form.Field>
    """
  end
end
