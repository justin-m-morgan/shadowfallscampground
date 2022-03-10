defmodule ShadowfallscampgroundEmail.EmailsView do
  use Phoenix.View, root: "lib/shadowfallscampground_email"

  import Swoosh.Email
  import Phoenix.Swoosh

  alias ShadowfallscampgroundEmail.{EmailLayoutsView, Recipient}

  @theme_color "#14532d"

  def new_email(%Recipient{} = recipient, opts \\ []) do
    assigns = Map.put(opts[:assigns] || %{}, :theme_color, @theme_color)

    new()
    |> put_view(__MODULE__)
    |> put_layout({EmailLayoutsView, :base})
    |> to({recipient.name, recipient.email})
    |> from(opts[:sender] || {"Bryan - Shadow Falls", fetch_system_sender_email()})
    |> subject(opts[:subject] || "Shadow Falls - Correspondence")
    |> render_body(opts[:template], assigns)
    |> transform_mjml()
  end

  def transform_mjml(email) do
    {:ok, mjml_compiled} =
      email
      |> Map.get(:html_body)
      |> Mjml.to_html()

    Map.put(email, :html_body, mjml_compiled)
  end

  def get_layout(struct) do
    struct
    |> Phoenix.Swoosh.layout()
    |> elem(1)
  end

  def get_template(struct) do
    struct.private.phoenix_template
  end

  def fetch_system_sender_email() do
    :shadowfallscampground
    |> Application.fetch_env!(ShadowfallscampgroundEmail.Mailer)
    |> Keyword.get(:username)
  end

  def email_url(email \\ nil, subject) do
    "mailto:"
    |> Kernel.<>(email || System.get_env("SMTP_USERNAME"))
    |> Kernel.<>("?")
    |> Kernel.<>(URI.encode_query([subject: subject], :rfc3986))
  end
end
