defmodule ShadowfallscampgroundWeb.Svg.Symbols.Envelope do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="envelope" viewBox="0 10 161 100">
      <path
        d="M138.186 9.53149H22.9558C15.7761 9.53149 9.95581 15.3518 9.95581 22.5315V104.489C9.95581 111.669 15.7761 117.489 22.9558 117.489H138.186C145.366 117.489 151.186 111.669 151.186 104.489V22.5315C151.186 15.3518 145.366 9.53149 138.186 9.53149Z"
        stroke-width="12"
      />
      <path d="M12.7804 12.8704L81.2771 62.9537L146.243 12.8704" stroke-width="11" />
    </SymbolTemplate>
    """
  end
end
