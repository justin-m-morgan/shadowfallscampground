defmodule ShadowfallscampgroundWeb.Forms.ErrorTag do
  @moduledoc """
  Error tag for forms
  """

  use ShadowfallscampgroundWeb, :component

  alias Surface.Components.Form

  @doc "Form field that error relates to"
  prop field, :atom, required: true

  @doc "Input label to accompany error"
  prop label, :string, required: true

  def render(assigns) do
    ~F"""
    <span>{@label}: <Form.ErrorTag field={:name} /></span>
    """
  end
end
