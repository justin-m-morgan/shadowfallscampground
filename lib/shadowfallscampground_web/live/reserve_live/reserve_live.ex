defmodule ShadowfallscampgroundWeb.ReserveLive do
  @moduledoc """
  LiveView for static pages
  """
  use ShadowfallscampgroundWeb, :live_view

  alias ShadowfallscampgroundWeb.Endpoint

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
    Steps
  }

  @one_minute 60 * 1000

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update_now, @one_minute)

    # season_start = ~D[2022-05-12]
    # season_end = ~D[2022-09-14]
    # lottery_open = ~D[2022-03-01]
    # lottery_close = ~D[2022-04-02]

    season_start =
      Application.get_env(:shadowfallscampground, :season_start, ~D[2022-05-12])
      |> stringdate_to_date()

    season_end =
      Application.get_env(:shadowfallscampground, :season_end, ~D[2022-09-14])
      |> stringdate_to_date()

    lottery_open = ~D[2022-03-31]
    # Application.get_env(:shadowfallscampground, :lottery_open, ~D[2022-04-01])
    # |> stringdate_to_date()

    lottery_close =
      Application.get_env(:shadowfallscampground, :lottery_close, ~D[2022-04-02])
      |> stringdate_to_date()

    lottery_period_end_date =
      Application.get_env(:shadowfallscampground, :lottery_period_end_date, ~D[2022-06-01])
      |> stringdate_to_date()

    socket
    |> assign(:now, Timex.now() |> datetime_to_tz())
    |> assign(:season_start, season_start)
    |> assign(:season_end, season_end)
    |> assign(:lottery_open, lottery_open |> datetime_to_tz())
    |> assign(:lottery_close, lottery_close |> datetime_to_tz())
    |> assign(:lottery_period_end_date, lottery_period_end_date)
    |> then(&{:ok, &1})
  end

  # defp datetime_to_tz(datetime_string) when is_binary(datetime_string) do
  #   datetime_string
  #   # |> Timex.parse!("{YYYY}-{MM}-{DD}")
  #   |> datetime_to_tz()
  # end

  defp stringdate_to_date(%Date{} = date), do: date

  defp stringdate_to_date(string_date) when is_binary(string_date) do
    string_date
    |> Timex.parse!("{YYYY}-{0M}-{0D}")
  end

  defp datetime_to_tz(%Date{} = date) do
    date
    |> NaiveDateTime.new!(~T[00:00:01])
    |> datetime_to_tz()
  end

  defp datetime_to_tz(valid_datetime) do
    Timex.to_datetime(valid_datetime, "America/Vancouver")
  end

  defp humanized_duration(time_before, time_until) do
    components =
      Timex.diff(time_until, time_before, :seconds)
      |> Timex.Duration.from_seconds()
      |> Timex.format_duration(:humanized)
      |> String.split(",")

    if length(components) > 1 do
      components
      |> Enum.reverse()
      |> Enum.drop(1)
      |> Enum.reverse()
      |> Enum.join(", ")
    else
      Enum.join(components, ", ")
    end
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



        <Steps.StepContainer id="reservation_form_step_container" :let={changeset: changeset}>
          <Components.Card padding={:lg} class="max-w-lg">
            <DateWindowListing />
          </Components.Card>
          <Components.Card padding={:lg} class="max-w-lg">
            <LotteryDefinition />
          </Components.Card>

          {#if Timex.before?(@now, @lottery_open)}

          <Components.Card padding={:lg} class="max-w-lg space-y-3">
          <h3 class="text-xl font-bold">Reservations will open on April 1st, 2022</h3>

          <p>All bookings made on April 1st will have an equal chance of securing a site. Their order of submission will be randomized after the close of the lottery period</p>

          <p>The following period will open on April 1: May 12 - June 1</p>

          <p>See the above table for when we will begin booking for other portions of the season.</p>

          <p class="text-lg font-semibold">Lottery opens in:</p>

          <p class="text-xl font-bold">{ humanized_duration(@now, @lottery_open) }</p>

        </Components.Card>

        {#else}
          {#if Timex.before?(@now, @lottery_clse) }
           <Components.Card padding={:lg} class="max-w-lg space-y-3">
            <h3 class="text-xl font-bold">Lottery System in Effect</h3>

            <p>All bookings made today will have an equal chance of securing a site. Their order of submission will be randomized after the close of the lottery period</p>

            <p>The lottery system applies to bookings for dates falling in May 12 - June 1</p>

            <p class="text-lg font-semibold">Lottery system in effect for:</p>

            <p class="text-xl font-bold">{ humanized_duration(@now, @lottery_close) }</p>

          </Components.Card>
          {/if}

          <Components.Card padding={:lg}>
            <Steps.ContactInfo changeset={changeset.changes[:contact_info] || ContactInfo.changeset()} />
          </Components.Card>

          <Components.Card padding={:lg}>
            <Steps.BasicDetails
              changeset={changeset}
              min_date={@season_start}
              max_date={@lottery_period_end_date}
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

        <Components.CallToAction type="redirect" to={Routes.page_path(Endpoint, :index)} size={:lg}>
          Back to Home Page
        </Components.CallToAction>
      </div>
    </div>
    """
  end
end
