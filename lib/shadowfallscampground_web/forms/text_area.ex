defmodule ShadowfallscampgroundWeb.Forms.TextArea do
  @moduledoc """
  TextArea Input
  """
  use ShadowfallscampgroundWeb, :component

  alias Surface.Components.Form
  alias ShadowfallscampgroundWeb.Forms.FormInput

  @doc "Field name"
  prop name, :atom, required: true

  @doc "Label text (computed from field name if not provided)"
  prop label, :string

  def render(assigns) do
    ~F"""
    <FormInput name={@name} label={@label}>
      <Form.TextArea rows={10} class="w-full rounded-md border-0" />
    </FormInput>
    """
  end
end
