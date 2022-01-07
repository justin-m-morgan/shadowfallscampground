defmodule ShadowfallscampgroundWeb.Components.Card.Playground do
  use Surface.Catalogue.Playground,
    subject: ShadowfallscampgroundWeb.Components.Card,
    height: "500px",
    body: [style: "padding: 1.5rem; background-color: #DEDEDE;"]

  alias ShadowfallscampgroundWeb.Svg

  data props, :map,
    default: %{
      label: "Test Heading"
    }

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <Card {...@props}>
      <Svg.IconSymbol name="faq" />
      <p>Ex veniam proident laborum culpa velit nostrud sunt excepteur velit aute. Mollit eu et laboris sint Lorem qui dolor officia. Sint consectetur do amet anim. Ut mollit dolor amet esse.</p>
    </Card>
    """
  end
end
