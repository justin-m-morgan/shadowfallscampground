defmodule ShadowfallscampgroundWeb.ReserveLiveTest do
  @moduledoc false

  use ShadowfallscampgroundWeb.ConnCase

  import Phoenix.LiveViewTest

  import Shadowfallscampground.Factories.Factory

  @invalid_attrs %{
    arrival: %{day: 30, month: 2},
    departure: %{day: 30, month: 2},
    type_of_request: nil
  }

  @form_identifier ~s/form[data-test="reservation_form"]/

  defp create_reservation(_) do
    %{
      valid_reservation_params: build(:reservation_form_params)
      # invalid_reservation_params: build(:)
    }
  end

  describe "Index" do
    setup [:create_reservation]

    test "shows reservation form", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.reserve_path(conn, :new))

      assert html =~ ~s/data-test="reservation_form"/
    end

    test "allows submitting of valid data", %{conn: conn, valid_reservation_params: params} do
      {:ok, index_live, _html} = live(conn, Routes.reserve_path(conn, :new))

      {:ok, _, html} =
        index_live
        |> form(@form_identifier, reservation: params)
        |> render_submit()

      # |> follow_redirect(conn, Routes.reservation_index_path(conn, :new))

      assert html =~ "Reservation created successfully"
    end

    # test "provides error feedback on invalid data", %{conn: conn} do
    #   {:ok, index_live, _html} = live(conn, Routes.reserve_path(conn, :new))

    #   assert index_live
    #          |> form(@form_identifier, reservation: @invalid_attrs)
    #          |> render_change() =~ "is invalid"
    # end

    # test "lists all reservations", %{conn: conn} do
    #   {:ok, _index_live, html} = live(conn, Routes.reservation_index_path(conn, :index))

    #   assert html =~ "Listing Reservations"
    # end

    # test "saves new reservation", %{conn: conn} do
    #   {:ok, index_live, _html} = live(conn, Routes.reservation_index_path(conn, :index))

    #   assert index_live |> element("a", "New Reservation") |> render_click() =~
    #            "New Reservation"

    #   assert_patch(index_live, Routes.reservation_index_path(conn, :new))

    #   assert index_live
    #          |> form("#reservation-form", reservation: @invalid_attrs)
    #          |> render_change() =~ "is invalid"

    #   {:ok, _, html} =
    #     index_live
    #     |> form("#reservation-form", reservation: @create_attrs)
    #     |> render_submit()
    #     |> follow_redirect(conn, Routes.reservation_index_path(conn, :index))

    #   assert html =~ "Reservation created successfully"
    # end

    # test "updates reservation in listing", %{conn: conn, reservation: reservation} do
    #   {:ok, index_live, _html} = live(conn, Routes.reservation_index_path(conn, :index))

    #   assert index_live |> element("#reservation-#{reservation.id} a", "Edit") |> render_click() =~
    #            "Edit Reservation"

    #   assert_patch(index_live, Routes.reservation_index_path(conn, :edit, reservation))

    #   assert index_live
    #          |> form("#reservation-form", reservation: @invalid_attrs)
    #          |> render_change() =~ "is invalid"

    #   {:ok, _, html} =
    #     index_live
    #     |> form("#reservation-form", reservation: @update_attrs)
    #     |> render_submit()
    #     |> follow_redirect(conn, Routes.reservation_index_path(conn, :index))

    #   assert html =~ "Reservation updated successfully"
    # end

    # test "deletes reservation in listing", %{conn: conn, reservation: reservation} do
    #   {:ok, index_live, _html} = live(conn, Routes.reservation_index_path(conn, :index))

    #   assert index_live |> element("#reservation-#{reservation.id} a", "Delete") |> render_click()
    #   refute has_element?(index_live, "#reservation-#{reservation.id}")
    # end
  end

  describe "Show" do
    setup [:create_reservation]

    # test "displays reservation", %{conn: conn, reservation: reservation} do
    #   {:ok, _show_live, html} = live(conn, Routes.reservation_show_path(conn, :show, reservation))

    #   assert html =~ "Show Reservation"
    # end

    # test "updates reservation within modal", %{conn: conn, reservation: reservation} do
    #   {:ok, show_live, _html} = live(conn, Routes.reservation_show_path(conn, :show, reservation))

    #   assert show_live |> element("a", "Edit") |> render_click() =~
    #            "Edit Reservation"

    #   assert_patch(show_live, Routes.reservation_show_path(conn, :edit, reservation))

    #   assert show_live
    #          |> form("#reservation-form", reservation: @invalid_attrs)
    #          |> render_change() =~ "is invalid"

    #   {:ok, _, html} =
    #     show_live
    #     |> form("#reservation-form", reservation: @update_attrs)
    #     |> render_submit()
    #     |> follow_redirect(conn, Routes.reservation_show_path(conn, :show, reservation))

    #   assert html =~ "Reservation updated successfully"
    # end
  end
end
