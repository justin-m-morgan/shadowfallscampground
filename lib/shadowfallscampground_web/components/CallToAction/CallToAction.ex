defmodule ShadowfallscampgroundWeb.Components.CallToAction do
  @moduledoc """
  Standardized button component
  """
  use Surface.Component

  alias Surface.Components.Link.Button
  alias Surface.Components.LivePatch

  @doc "The page to link to"
  prop to, :string

  @doc "Patch rather than link"
  prop patch, :boolean, default: false

  @doc "A click event"
  prop click, :event

  @doc "The method to use with the button"
  prop method, :atom, default: :post

  @doc "Class or classes to apply to the button"
  prop class, :css_class

  @doc "Relative size of button (font/spacing)"
  prop size, :atom, default: :md, values: [:xs, :sm, :md, :lg, :xl]

  @doc "Button variant"
  prop variant, :atom, default: :solid, values: [:solid, :outline, :ghost]

  prop type, :string, values: ["submit", "button"]

  @doc "Additional attributes to add onto the generated element"
  prop opts, :keyword, default: []

  @doc "phx_disable_with prop"
  prop disable_with, :string

  slot default, required: true

  def render(%{type: _} = assigns) do
    ~F"""
    <button
      :on-click={@click}
      phx_disable_with={@disable_with}
      type={@type}
      class={classes(@size, @variant), @class}
    >
      <#slot />
    </button>
    """
  end

  def render(%{patch: true} = assigns) do
    ~F"""
    <LivePatch to={@to} class={classes(@size, @variant), @class}>
      opts={@opts}>
      <#slot />
    </LivePatch>
    """
  end

  def render(assigns) do
    ~F"""
    <Button to={@to} method={@method} class={classes(@size, @variant), @class}>
      opts={@opts}>
      <#slot />
    </Button>
    """
  end

  defp size(:xs), do: ["py-2 px-2 text-sm"]
  defp size(:sm), do: ["py-2 px-3"]
  defp size(:md), do: ["py-3 px-4 text-lg"]
  defp size(:lg), do: ["py-4 px-6 text-xl"]
  defp size(:xl), do: ["py-6 px-8 text-2xl"]
  defp size(_), do: size(:md)

  defp variant(:solid), do: ["bg-accent-900", "text-accent-100", "hover:bg-accent-800"]

  defp variant(:outline),
    do: ["bg-transparent", "text-accent-800", "border-2", "border-accent-800"]

  defp variant(:ghost), do: ["bg-transparent", "text-accent-800"]
  defp variant(_), do: variant(:solid)

  defp common() do
    [
      "text-center font-bold",
      "shadow-lg",
      "rounded-lg",
      "transform hover:scale-105 transition-transform duration-75"
    ]
  end

  defp classes(size, variant) do
    [common(), size(size), variant(variant)] |> Enum.concat()
  end
end
