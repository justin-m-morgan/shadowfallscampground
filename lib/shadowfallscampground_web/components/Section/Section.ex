defmodule ShadowfallscampgroundWeb.Components.Section do
  @moduledoc """
  A responsive section container
  """
  use ShadowfallscampgroundWeb, :component

  slot default, required: true

  def render(assigns) do
    ~F"""
    <section class="py-8">
      <#slot />
    </section>
    """
  end
end
