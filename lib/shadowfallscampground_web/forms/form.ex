defmodule ShadowfallscampgroundWeb.Forms.Form do
  @moduledoc """
  Generalized template for web forms
  """
  use ShadowfallscampgroundWeb, :component

  @doc "Heading for form component"
  prop title, :string

  @doc "Changeset to control the form"
  prop changeset, :map, required: true

  @doc "Action event name for form changes"
  prop change, :event, required: true

  @doc "Action event name for form submissions"
  prop submit, :event, required: true

  @doc "Identifying tag for targeting during testing"
  prop data_test, :string, required: true

  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class="w-full flex flex-col items-center pb-8">
      {#if @title}
        <h2 class="text-center text-4xl text-primary-900 font-bold pb-8">{@title}</h2>
      {/if}

      <Surface.Components.Form
        for={@changeset}
        change={@change}
        submit={@submit}
        class={
          "min-w-[45ch] w-full max-w-2xl",
          "flex flex-col space-y-3",
          "px-8 py-4"
        }
        opts={data_test: @data_test}
      >
        <#slot />
      </Surface.Components.Form>
    </div>
    """
  end
end
