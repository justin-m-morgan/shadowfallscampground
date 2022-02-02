defmodule ShadowfallscampgroundWeb.Components.Image do
  @moduledoc """
  Standardized image component
  """
  use Surface.Component

  @cloudinary_base "https://res.cloudinary.com/dwuyw1sdq/image/upload"
  @album "v1642454485/shadowfalls"

  @doc "Image file name (with extension)"
  prop src, :string, required: true

  @doc "srcset image sizes. Intrinsic width (ex 450w) or dpi formats (ex 2x) acceptable"
  prop srcset, :list,
    default: [
      {450, "450w"},
      {600, "600w"}
    ]

  @doc "Alt-text for image"
  prop alt, :string, required: true

  @doc "Extra css classes"
  prop class, :css_class

  @doc "Label for targetting in tests"
  prop test_label, :string

  def render(assigns) do
    ~F"""
    <img
      src={source_formatter(@src)}
      srcset={srcset(@src, @srcset)}
      alt={@alt}
      loading="lazy"
      class={@class}
      data-test={@test_label}
    />
    """
  end

  defp remote_image(filename, dimension) when is_integer(dimension),
    do: remote_image(filename, {dimension, dimension})

  defp remote_image(filename, dimension) do
    [
      @cloudinary_base,
      cloudinary_fill_scale(dimension),
      cloudinary_auto_format(),
      @album,
      filename
    ]
    |> Enum.join("/")
  end

  # credo:disable-for-next-line
  defp cloudinary_fill_scale({width, height}), do: "c_fill,g_center,w_#{width},h_#{height}"

  defp cloudinary_auto_format(), do: "f_auto"

  defp source_formatter("#"), do: "/images/dummy_image.svg"
  defp source_formatter(src), do: remote_image(src, 300)

  def srcset(src, srcset) do
    srcset
    |> Enum.map_join(", ", fn {dimension, i_width} ->
      "#{remote_image(src, dimension)} #{i_width}"
    end)
  end
end
