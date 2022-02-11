defmodule ShadowfallscampgroundEmail.Notifiers.WelcomeNotifier do
  use Phoenix.Swoosh,
    view: ShadowfallscampgroundEmail.EmailsView,
    layout: {ShadowfallscampgroundEmail.EmailLayoutsView, :base}

  def welcome(%{email: email, name: name} = person) do
    new()
    |> from("test@email.com")
    |> to({name, email})
    |> subject("test email")
    |> render_body(:welcome, person)
  end
end
