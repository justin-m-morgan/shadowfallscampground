defmodule ShadowfallscampgroundEmail.Notifiers.WelcomeNotifier do

  import ShadowfallscampgroundEmail.EmailsView, only: [new_email: 4]

  def welcome(person) do
    new_email({person.name, person.email}, "test email", :welcome, person)
  end
end
