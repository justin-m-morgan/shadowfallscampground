defmodule ShadowfallscampgroundWeb.Components.Card do
  @moduledoc """
  A standardized card element.

  Accepts an optional icon element (or any arbitrary code in the "icon" slot)
  """
  use ShadowfallscampgroundWeb, :component

  prop class, :css_class

  prop padding, :atom, values: [:none, :sm, :md, :lg, :xl, :xxl], default: :none

  @doc "Heading content"
  prop label, :string

  prop text_color, :atom, default: :dark, values: [:dark, :light, :ignore]

  slot default, required: true

  slot icon

  def render(assigns) do
    ~F"""
    <div class={
      "bg-gray-50/90 filter backdrop-blur-lg border-bg-gray-200/40 shadow-xl rounded",
      "flex flex-col justify-between",
      "text-center",
      text_color(@text_color),
      padding(@padding),
      @class
    }>
      <div class="flex justify-center">
        <#slot name="icon" />
      </div>
      <h3 :if={@label} class="text-xl font-black">{@label}</h3>
      <#slot />
    </div>
    """
  end

  defp text_color(:dark), do: "text-primary-900"
  defp text_color(:light), do: "text-primary-50"
  defp text_color(:ignore), do: nil

  defp padding(:none), do: ""
  defp padding(:sm), do: "px-2 py-2"
  defp padding(:md), do: "px-4 py-4"
  defp padding(:lg), do: "px-6 py-8"
  defp padding(:xl), do: "px-8 py-12"
  defp padding(:xxl), do: "px-12 py-16"
end
