defmodule ShadowfallscampgroundWeb.Components.Image do
  @moduledoc """
  Standardized image component
  """
  use Surface.Component

  prop src, :string, required: true

  prop alt, :string, required: true

  prop class, :css_class

  @doc "Label for targetting in tests"
  prop test_label, :string

  def render(assigns) do
    ~F"""
    <img src={source_formatter(@src)} alt={@alt} class={@class} data-test={@test_label}>
    """
  end

  defp source_formatter("#"), do: "/images/dummy_image.svg"
  defp source_formatter("http" <> _ = src), do: src
  defp source_formatter(src), do: "/images/" <> src

  def srcset(src) do
    src
    |> src_splitter()
    |> src_sizer(src_sizes())
    |> Enum.join(", ")
  end

  defp src_splitter(src) do
    ("/images/" <> src)
    |> String.split(".")
    |> List.to_tuple()
  end

  defp src_sizes() do
    [
      {"2x", "600w"},
      {"3x", "1200w"},
      {"4x", "2000w"}
    ]
  end

  defp src_sizer({src, ext}, sizes) do
    sizes
    |> Enum.map(&src_sizer_one(&1, {src, ext}))
  end

  defp src_sizer_one({size, width}, {src, ext}) do
    "#{src}_#{size}.#{ext} #{width}"
  end
end
