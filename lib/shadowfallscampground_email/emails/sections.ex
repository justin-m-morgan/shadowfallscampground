defmodule ShadowfallscampgroundEmail.Emails.Sections do
  @moduledoc """
  Partials for composing email sections.
  """

  use Phoenix.Component

  def test_section(assigns) do
    ~H"""
    <mj-text color={ @text_color } font-weight="bold" font-size="20px">
      Croft's in Austin is opening December 20th
    </mj-text>
    """
  end
end
