defmodule ShadowfallscampgroundWeb.InquiryLive.FormComponent do
  @moduledoc """
  Form component for submitting an inquiry
  """

  use ShadowfallscampgroundWeb, :live_component

  alias Shadowfallscampground.{Inquiries, Workers.MailerWorker}
  alias ShadowfallscampgroundEmail.{Mailer, Notifiers}
  alias ShadowfallscampgroundWeb.Forms

  @impl true
  def update(%{inquiry: inquiry} = assigns, socket) do
    changeset = Inquiries.change_inquiry(inquiry)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"inquiry" => inquiry_params}, socket) do
    changeset =
      socket.assigns.inquiry
      |> Inquiries.change_inquiry(inquiry_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"inquiry" => inquiry_params}, socket) do
    save_inquiry(socket, socket.assigns.action, inquiry_params)
  end

  defp save_inquiry(socket, :edit, inquiry_params) do
    case Inquiries.update_inquiry(socket.assigns.inquiry, inquiry_params) do
      {:ok, _inquiry} ->
        {:noreply,
         socket
         |> put_flash(:info, "Inquiry updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_inquiry(socket, :inquiry, inquiry_params),
    do: save_inquiry(socket, :new, inquiry_params)

  defp save_inquiry(socket, :new, inquiry_params) do
    with {:ok, _inquiry} <- Inquiries.create_inquiry(inquiry_params),
         [%_{}, %_{}] <- MailerWorker.mail_inquiry_submission_and_receipt(inquiry_params) do
      #   #  submission_email <- Notifiers.Message.message(inquiry_params),
      #   #  receipt_email <- Notifiers.Message.receipt(inquiry_params) do
      # Mailer.deliver!(submission_email)
      # Mailer.deliver!(receipt_email)

      {:noreply,
       socket
       |> put_flash(:info, successful_submission_message())
       |> push_redirect(to: socket.assigns.return_to)}
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}

      _ ->
        {:noreply, socket}
    end

    # case Inquiries.create_inquiry(inquiry_params) do
    #   {:ok, _inquiry} ->
    #     {:noreply,
    #      socket
    #      |> put_flash(
    #        :info,
    #        successful_submission_message()
    #      )
    #      |> push_redirect(to: socket.assigns.return_to)}

    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     {:noreply, assign(socket, changeset: changeset)}
    # end
  end

  def successful_submission_message(),
    do:
      "Thank you. We've received your message. You should receive an emailed receipt within a minute."
end
