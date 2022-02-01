defmodule ShadowfallscampgroundWeb.Components.Section do
  @moduledoc """
  A responsive section container
  """
  use ShadowfallscampgroundWeb, :component

  slot default, required: true

  def render(assigns) do
    ~F"""
    <section class="container mx-auto py-8 lg:py-24" data-test="section-component">
      <#slot />
    </section>
    """
  end
end
