defmodule ShadowfallscampgroundWeb.Svg.SymbolTemplate do
  @moduledoc """
  A standardized symbol definition
  """
  use Surface.Component

  @doc "Id for accessing the symbol (will be prepended with 'icon-'"
  prop id, :string, required: true

  @doc "Defined viewbox"
  prop viewBox, :string, required: true

  @doc "Extra css classes"
  prop class, :css_class

  slot default, required: true

  def render(assigns) do
    ~F"""
    <symbol id={"icon-" <> @id} class={icon_classes(), @class} viewBox={@viewBox} fill="none">
      <#slot />
    </symbol>
    """
  end

  defp icon_classes() do
    "h-full max-w-24 stroke-current"
  end
end
