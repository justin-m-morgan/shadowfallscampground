defmodule ShadowfallscampgroundWeb.ReservationLiveTest do
  use ShadowfallscampgroundWeb.ConnCase

  # import Phoenix.LiveViewTest
  import Shadowfallscampground.Factory

  # alias Shadowfallscampground.Repo
  # alias Shadowfallscampground.Requests.Reservation

  # @create_attrs build(:reservation_params)
  # @update_attrs build(:reservation_params)
  # @invalid_attrs %{
  #   arrival: %{day: 30, month: 2, year: 2022},
  #   departure: %{day: 30, month: 2, year: 2022},
  #   email: nil,
  #   name: nil,
  #   type_of_request: nil
  # }

  defp create_reservation(_) do
    reservation = insert(:reservation)
    %{reservation: reservation}
  end

  describe "Making a Reservation" do
    # test "should persist the reservation to the database", %{conn: conn}  do

    #   reservation_params = build(:reservation_params)
    #   {:ok, reserve_live, _original_html } = live(conn, Routes.reserve_path(conn, :new))

    #   reserve_live
    #   |> form(~s/[data-test="reservation-form"]/, reservation: reservation_params)
    #   |> render_submit()

    #   assert Reservation
    #     |> Repo.all()
    #     |> Enum.any?(fn reservation -> reservation.email == reservation_params[:email] end)
    # end

    #   test "should redirect to an empty form after submitting", %{conn: conn}  do

    #     reservation_params = build(:reservation_params)
    #     {:ok, reserve_live, _original_html } = live(conn, Routes.reserve_path(conn, :new))

    #     reserve_live
    #     |> form(~s/[data-test="reservation-form"]/, reservation: reservation_params)
    #     |> render_submit()

    #     name_input_html =
    #       reserve_live
    #       |> Floki.find(~s/input[name="reservation[name]"]/)
    #       |> Floki.raw_html()

    #     refute name_input_html =~ reservation_params[:name]
    #   end
  end

  describe "Index" do
    # setup [:create_reservation]

    # test "lists all reservations", %{conn: conn, reservation: reservation} do
    #   {:ok, _index_live, html} = live(conn, Routes.reservation_index_path(conn, :index))

    #   assert html =~ "Listing Reservations"
    #   assert html =~ reservation.email
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
    #   assert html =~ "some email"
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
    #   assert html =~ "some updated email"
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
    #   assert html =~ reservation.email
    # end

    #   test "updates reservation within modal", %{conn: conn, reservation: reservation} do
    #     {:ok, show_live, _html} = live(conn, Routes.reservation_show_path(conn, :show, reservation))

    #     assert show_live |> element("a", "Edit") |> render_click() =~
    #              "Edit Reservation"

    #     assert_patch(show_live, Routes.reservation_show_path(conn, :edit, reservation))

    #     assert show_live
    #            |> form("#reservation-form", reservation: @invalid_attrs)
    #            |> render_change() =~ "is invalid"

    #     {:ok, _, html} =
    #       show_live
    #       |> form("#reservation-form", reservation: @update_attrs)
    #       |> render_submit()
    #       |> follow_redirect(conn, Routes.reservation_show_path(conn, :show, reservation))

    #     assert html =~ "Reservation updated successfully"
    #     assert html =~ "some updated email"
    #   end
  end
end
