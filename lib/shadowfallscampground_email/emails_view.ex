defmodule ShadowfallscampgroundEmail.EmailsView do
  use Phoenix.View, root: "lib/shadowfallscampground_email"

  import Swoosh.Email
  import Phoenix.Swoosh

  alias ShadowfallscampgroundEmail.EmailLayoutsView

  @theme_color "#14532d"

  def new_email(recipient, subject, template, assigns \\ %{}) do
    new()
    |> put_view(__MODULE__)
    |> put_layout({EmailLayoutsView, :base})
    |> to(recipient)
    |> from({"Bryan - Shadow Falls", config_email()})
    |> subject(subject)
    |> render_body(template, Map.put(assigns, :theme_color, @theme_color))
    |> transform_mjml()
  end

  def transform_mjml(email) do
    {:ok, mjml_compiled} =
      email
      |> Map.get(:html_body)
      |> Mjml.to_html()
      |> IO.inspect()

    Map.put(email, :html_body, mjml_compiled)
  end

  defp config_email() do
    :shadowfallscampground
    |> Application.fetch_env!(ShadowfallscampgroundEmail.Mailer)
    |> Keyword.get(:username)
  end
end
