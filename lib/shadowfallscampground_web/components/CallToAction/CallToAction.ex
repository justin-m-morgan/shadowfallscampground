defmodule ShadowfallscampgroundWeb.Components.CallToAction do
  @moduledoc """
  Standardized button component
  """
  use Surface.Component

  alias Surface.Components.{LivePatch, LiveRedirect}

  @doc "The page to link to"
  prop to, :string

  @doc "Type of link"
  prop type, :string, values: ["button", "link", "submit", "patch", "redirect"], default: "button"

  @doc "A click event"
  prop click, :event

  @doc "The method to use with the button"
  prop method, :atom, default: :post

  @doc "Class or classes to apply to the button"
  prop class, :css_class

  @doc "Relative size of button (font/spacing)"
  prop size, :atom, default: :md, values: [:xs, :sm, :md, :lg, :xl]

  @doc "Button variant"
  prop variant, :atom, default: :solid, values: [:solid, :outline, :outline_light, :ghost]

  @doc "Additional attributes to add onto the generated element"
  prop opts, :keyword, default: []

  @doc "phx_disable_with prop"
  prop disable_with, :string

  slot default, required: true

  def render(%{type: "patch"} = assigns) do
    ~F"""
    <LivePatch to={@to} class={classes(@size, @variant), @class} opts={@opts}>
      <#slot />
    </LivePatch>
    """
  end

  def render(%{type: "redirect"} = assigns) do
    ~F"""
    <LiveRedirect to={@to} class={classes(@size, @variant), @class} opts={@opts}>
      <#slot />
    </LiveRedirect>
    """
  end

  def render(%{type: "link"} = assigns) do
    ~F"""
    <a href={@to} class={classes(@size, @variant), @class} data-test={@opts[:data_test]}>
      <#slot />
    </a>
    """
  end

  def render(assigns) do
    ~F"""
    <button
      :on-click={@click}
      phx_disable_with={@disable_with}
      type={@type}
      class={classes(@size, @variant), @class}
      data-test={@opts[:data_test]}
    >
      <#slot />
    </button>
    """
  end

  # def render(assigns) do
  #   ~F"""
  #   <Button to={@to} method={@method} class={classes(@size, @variant), @class}>
  #     opts={@opts}>
  #     <#slot />

  #   </Button>
  #   """
  # end

  defp size(:xs), do: ["py-2 px-2 text-sm"]
  defp size(:sm), do: ["py-2 px-3"]
  defp size(:md), do: ["py-3 px-4 text-lg"]
  defp size(:lg), do: ["py-4 px-6 text-xl lg:py-6 lg:px-8 xl:text-2xl"]
  defp size(:xl), do: ["py-6 px-8 text-2xl lg:py-8 lg:px-12 xl:text-3xl"]
  defp size(_), do: size(:md)

  defp variant(:solid), do: ["bg-accent-900", "text-accent-100", "hover:bg-accent-800"]

  defp variant(:outline),
    do: ["bg-transparent", "text-accent-800", "border-2", "border-accent-800"]

  defp variant(:outline_light),
    do: [
      "bg-accent-900/30",
      "text-accent-50",
      "border-4",
      "border-accent-400",
      "hover:scale-110",
      "hover:bg-accent-400"
    ]

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
