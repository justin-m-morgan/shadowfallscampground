defmodule ShadowfallscampgroundWeb.InquiryLiveTest do
  @moduledoc false
  use ShadowfallscampgroundWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import Swoosh.TestAssertions
  import Shadowfallscampground.Factories.Factory

  alias ShadowfallscampgroundWeb.InquiryLive.FormComponent
  alias ShadowfallscampgroundEmail.Notifiers.Message

  defp create_inquiry(_) do
    inquiry = insert(:inquiry)
    %{inquiry: inquiry}
  end

  describe "Submitting an Inquiry" do
    setup [:create_inquiry]

    test "saves new inquiry", %{conn: conn} do
      inquiry_params = build(:inquiry_params)

      {:ok, index_live, _html} = live(conn, Routes.page_path(conn, :index))

      index_live
      |> element(~s/[data-test="send_inquiry_button"]/)
      |> render_click()
      |> then(fn _ ->
        index_live
        |> form(~s/[data-test="inquiry_form_component"]/, inquiry: inquiry_params)
        |> render_submit()
        |> follow_redirect(conn, Routes.page_path(conn, :index))
        |> then(fn {:ok, redirected_view, _} ->
          redirected_view
          |> element(~s/[data-test="flash-info"]/)
          |> render()
          |> Floki.parse_fragment!()
          |> Floki.text()
          |> then(fn text ->
            assert text =~ FormComponent.successful_submission_message()
          end)
        end)
      end)
    end

    # test "updates inquiry in listing", %{conn: conn, inquiry: inquiry} do
    #   {:ok, index_live, _html} = live(conn, Routes.inquiry_index_path(conn, :index))

    #   assert index_live |> element("#inquiry-#{inquiry.id} a", "Edit") |> render_click() =~
    #            "Edit Inquiry"

    #   assert_patch(index_live, Routes.inquiry_index_path(conn, :edit, inquiry))

    #   assert index_live
    #          |> form("#inquiry-form", inquiry: @invalid_attrs)
    #          |> render_change() =~ "can&#39;t be blank"

    #   {:ok, _, html} =
    #     index_live
    #     |> form("#inquiry-form", inquiry: @update_attrs)
    #     |> render_submit()
    #     |> follow_redirect(conn, Routes.inquiry_index_path(conn, :index))

    #   assert html =~ "Inquiry updated successfully"
    #   assert html =~ "some updated email"
    # end

    # test "deletes inquiry in listing", %{conn: conn, inquiry: inquiry} do
    #   {:ok, index_live, _html} = live(conn, Routes.inquiry_index_path(conn, :index))

    #   assert index_live |> element("#inquiry-#{inquiry.id} a", "Delete") |> render_click()
    #   refute has_element?(index_live, "#inquiry-#{inquiry.id}")
    # end
  end

  # describe "Show" do
  #   setup [:create_inquiry]

  #   test "displays inquiry", %{conn: conn, inquiry: inquiry} do
  #     {:ok, _show_live, html} = live(conn, Routes.inquiry_show_path(conn, :show, inquiry))

  #     assert html =~ "Show Inquiry"
  #     assert html =~ inquiry.email
  #   end

  #   test "updates inquiry within modal", %{conn: conn, inquiry: inquiry} do
  #     {:ok, show_live, _html} = live(conn, Routes.inquiry_show_path(conn, :show, inquiry))

  #     assert show_live |> element("a", "Edit") |> render_click() =~
  #              "Edit Inquiry"

  #     assert_patch(show_live, Routes.inquiry_show_path(conn, :edit, inquiry))

  #     assert show_live
  #            |> form("#inquiry-form", inquiry: @invalid_attrs)
  #            |> render_change() =~ "can&#39;t be blank"

  #     {:ok, _, html} =
  #       show_live
  #       |> form("#inquiry-form", inquiry: @update_attrs)
  #       |> render_submit()
  #       |> follow_redirect(conn, Routes.inquiry_show_path(conn, :show, inquiry))

  #     assert html =~ "Inquiry updated successfully"
  #     assert html =~ "some updated email"
  #   end
  # end
end
