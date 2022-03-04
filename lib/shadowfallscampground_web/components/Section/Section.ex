defmodule ShadowfallscampgroundWeb.Components.Section do
  @moduledoc """
  A responsive section container
  """
  use ShadowfallscampgroundWeb, :component

  prop section_label, :string, required: true

  prop section_label_hidden, :boolean, default: false

  prop skip_section_label, :boolean, default: false

  slot default, required: true

  def render(assigns) do
    ~F"""
    <section class="container mx-auto px-2 py-8 lg:py-24" data-test="section-component">
      <h2
        :if={!@skip_section_label}
        class={
          "text-3xl md:text-5xl lg:text-7xl text-primary-100 font-bold text-center",
          "pb-8",
          hidden: @section_label_hidden
        }
      >
        {@section_label}
      </h2>

      <#slot />
    </section>
    """
  end
end
