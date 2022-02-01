defmodule ShadowfallscampgroundWeb.Forms.NumberInput do
  @moduledoc """
  Number Input
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
      <Form.TextInput class="w-full rounded-md" opts={[input_mode: "numeric", pattern: "[0-9]*"]}/>
    </FormInput>
    """
  end
end
