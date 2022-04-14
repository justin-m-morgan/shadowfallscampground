defmodule ShadowfallscampgroundWeb.ReserveLive do
  @moduledoc """
  LiveView for static pages
  """
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Endpoint

  alias Shadowfallscampground.Data.Dates

  alias Shadowfallscampground.Requests.{
    Attendees,
    ContactInfo,
    FinalRemarks,
    Reservation,
    RvDetails,
    TentDetails
  }

  alias ShadowfallscampgroundWeb.ReserveLive.{
    DateWindowListing,
    LotteryDefinition,
    LotteryManager,
    Steps
  }

  @one_minute 60 * 1000

  data now, :struct, default: Timex.now()

  def mount(socket) do
    Process.send_after(self(), :update_now, @one_minute)

    socket
    |> assign(:now, Timex.now() |> datetime_to_tz())
    |> then(&{:ok, &1})
  end

  @impl true
  def handle_info({:put_flash, type, message}, socket) do
    socket
    |> put_flash(type, message)
    |> tap(fn _ -> Process.send_after(self(), :clear_flash, 5000) end)
    |> then(&{:noreply, &1})
  end

  def handle_info(:clear_flash, socket) do
    socket
    |> clear_flash()
    |> then(&{:noreply, &1})
  end

  def handle_info(:successful_submission, socket) do
    socket
    |> assign(:live_action, :successful_submission)
    |> then(&{:noreply, &1})
  end

  def handle_info(:update_now, socket) do
    Process.send_after(self(), :update_now, @one_minute)

    socket
    |> assign(:now, Timex.now() |> datetime_to_tz())
    |> then(&{:noreply, &1})
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Reserve")
    |> assign(:reservation, %Reservation{})
  end

  defp apply_action(socket, :successful_submission, _params) do
    socket
    |> assign(:live_action, :successful_submission)
  end

  @impl true
  def render(assigns) do
    ~F"""
    <Svg.IconSet />
    <div class="bg-trees min-h-screen">
      <div class="bg-primary-900/60 flex flex-col justify-center items-center min-h-screen pt-12">
        {#if @live_action in [:successful_submission]}
          <.modal return_to={Routes.reserve_path(@socket, :new)}>
            <.live_component
              module={ShadowfallscampgroundWeb.ReserveLive.SuccessfulSubmission}
              id="successful_submission_modal"
              title={@page_title}
              action={@live_action}
              return_to={Routes.reserve_path(@socket, :new)}
            />
          </.modal>
        {/if}


      <LotteryManager id="lottery-manager" :let={
        season_start: season_start,
        season_end: season_end,
        lottery_open: lottery_open,
        lottery_close: lottery_close,
        lottery_period_start_date: lottery_period_start_date,
        lottery_period_end_date: lottery_period_end_date
      }>

        <Steps.StepContainer id="reservation_form_step_container" :let={changeset: changeset}>
          <Components.Card padding={:lg} class="max-w-lg">
            <DateWindowListing />
          </Components.Card>
          <Components.Card padding={:lg} class="max-w-lg">
            <LotteryDefinition />
          </Components.Card>

          {#if Timex.before?(@now, lottery_open)}

          <Components.Card padding={:lg} class="max-w-lg space-y-3">

          <p>All bookings made on April 1st will have an equal chance of securing a site. Their order of submission will be randomized after the close of the lottery period</p>

          <p>The following period will open on {Dates.Formatting.pretty_date(lottery_open)}: {Dates.Formatting.pretty_date(lottery_period_start_date)} - {Dates.Formatting.pretty_date(lottery_period_end_date)}</p>

          <p>See the above table for when we will begin booking for other portions of the season.</p>

          <p class="text-lg font-semibold">Lottery opens in:</p>

          <p class="text-xl font-bold">{ LotteryManager.humanized_duration(datetime_to_tz(@now) , datetime_to_tz(lottery_open)) }</p>

        </Components.Card>

        {#else}
           <Components.Card padding={:lg} class="max-w-lg space-y-3">
            <h3 class="text-xl font-bold">Lottery System in Effect</h3>

            <p>All bookings made before midnight of April 15th will have an equal chance of securing a site. Their order of submission will be randomized after the close of the lottery period</p>

            <p>The lottery system applies to bookings for dates falling in June 23rd - July 13th</p>
    <!--
            <p class="text-lg font-semibold">Lottery system in effect for:</p>

            <p class="text-xl font-bold">{ LotteryManager.humanized_duration(@now, lottery_close) }</p>
    -->
          </Components.Card>

          <Components.Card padding={:lg}>
            <Steps.ContactInfo changeset={changeset.changes[:contact_info] || ContactInfo.changeset()} />
          </Components.Card>

          <Components.Card padding={:lg}>
            <Steps.BasicDetails
              changeset={changeset}
              min_date={season_start}
              max_date={lottery_period_end_date}
              />
          </Components.Card>

          {#case Ecto.Changeset.get_field(changeset, :type_of_request)}
            {#match :tent}
              <Components.Card padding={:lg}>
                <Steps.TentDetails changeset={changeset.changes[:tent_details] || TentDetails.changeset()} />
              </Components.Card>
            {#match :rv}
              <Components.Card padding={:lg}>
                <Steps.RvDetails changeset={changeset.changes[:rv_details] || RvDetails.changeset()} />
              </Components.Card>
            {#match _}
              <Components.Card padding={:lg}>
                <p>Please select a type of request in the previous step</p>
              </Components.Card>
          {/case}

          <Components.Card padding={:lg}>
            <Steps.Attendees changeset={changeset.changes[:attendees] || Attendees.changeset()} />
          </Components.Card>

          <Components.Card padding={:lg}>
            <Steps.FinalRemarks changeset={changeset.changes[:final_remarks] || FinalRemarks.changeset()} />
          </Components.Card>

          <Components.Card padding={:lg} class="max-w-lg">
            <Steps.Summary id="reservation-form__summary" changeset={changeset} />
          </Components.Card>
          {/if}
        </Steps.StepContainer>
    </LotteryManager>
        <Components.CallToAction type="redirect" to={Routes.page_path(Endpoint, :index)} size={:lg}>
          Back to Home Page
        </Components.CallToAction>
      </div>
    </div>
    """
  end

  def datetime_to_tz(%Date{} = date) do
    date
    |> NaiveDateTime.new!(~T[00:00:01])
    |> datetime_to_tz()
  end

  def datetime_to_tz(valid_datetime) do
    Timex.to_datetime(valid_datetime, "America/Vancouver")
  end
end
