defmodule ShadowfallscampgroundWeb.Forms.EmailInput do
  @moduledoc """
  Email Input
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
      <Form.EmailInput class="w-full rounded-md" />
    </FormInput>
    """
  end
end
