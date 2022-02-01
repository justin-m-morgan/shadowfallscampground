defmodule ShadowfallscampgroundWeb.Components.Section.Example01 do
  @moduledoc false

  use Surface.Catalogue.Example,
    subject: ShadowfallscampgroundWeb.Components.Section,
    height: "480px",
    body: [style: "padding: 1.5rem; background-color: #DDDDDD;"],
    title: ""

  alias ShadowfallscampgroundWeb.Components.Section

  def render(assigns) do
    ~F"""
    <Section>
      <h2>Sample content</h2>
      <p>Mollit proident ea labore nisi esse qui laboris commodo sit ex. Labore do aliqua nostrud commodo enim dolor eiusmod ex mollit. Et consequat reprehenderit proident labore eiusmod eiusmod eiusmod excepteur proident eiusmod nulla cupidatat anim. Id cillum laborum qui proident occaecat eu eiusmod ad officia esse officia velit amet. Qui ipsum laboris non non eiusmod est deserunt exercitation.</p>
    </Section>
    """
  end
end
