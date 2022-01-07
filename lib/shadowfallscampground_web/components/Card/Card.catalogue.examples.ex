defmodule ShadowfallscampgroundWeb.Components.Card.Example01 do
  @moduledoc """
  With Icon
  """
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.Card,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Components.Card

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <Card>
      <Svg.IconSymbol name="faq" />
      <p>Ex veniam proident laborum culpa velit nostrud sunt excepteur velit aute. Mollit eu et laboris sint Lorem qui dolor officia. Sint consectetur do amet anim. Ut mollit dolor amet esse.</p>
    </Card>
    """
  end
end

defmodule ShadowfallscampgroundWeb.Components.Card.Example02 do
  @moduledoc """
  With Icon and label
  """
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.Card,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Components.Card

  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <Card label="Test Title">
      <Svg.IconSymbol name="faq" />
      <p>Ex veniam proident laborum culpa velit nostrud sunt excepteur velit aute. Mollit eu et laboris sint Lorem qui dolor officia. Sint consectetur do amet anim. Ut mollit dolor amet esse.</p>
    </Card>
    """
  end
end

defmodule ShadowfallscampgroundWeb.Components.Card.Example03 do
  @moduledoc """
  Without Icon/With Label
  """
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.Card,
    height: "480px",
    title: ""

  alias ShadowfallscampgroundWeb.Components.Card

  def render(assigns) do
    ~F"""
    <Card label="Test Title">
      <p>Ex veniam proident laborum culpa velit nostrud sunt excepteur velit aute. Mollit eu et laboris sint Lorem qui dolor officia. Sint consectetur do amet anim. Ut mollit dolor amet esse.</p>
    </Card>
    """
  end
end

defmodule ShadowfallscampgroundWeb.Components.Card.Example04 do
  @moduledoc """
  With :light text and padding options set
  """
  alias ShadowfallscampgroundWeb.Svg

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.Card,
    height: "480px",
    title: "",
    body: [style: "padding: 1.5rem; background-color: #004400;"]

  alias ShadowfallscampgroundWeb.Components.Card

  def render(assigns) do
    ~F"""
    <Card label="Test Title" text_color={:light} padding={:xl}>
      <p>Ex veniam proident laborum culpa velit nostrud sunt excepteur velit aute. Mollit eu et laboris sint Lorem qui dolor officia. Sint consectetur do amet anim. Ut mollit dolor amet esse.</p>
    </Card>
    """
  end
end
