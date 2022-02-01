defmodule Shadowfallscampground.DatePickerTest do
  use Shadowfallscampground.DataCase, async: true

  import Shadowfallscampground.Data.Dates.DatePicker

  describe "Generating date sets (no focused_start_date): " do
    setup [:setup_date_range]

    test "should produce starting_month from min to max - 1 day", context do
      generated_ranges = generate_dates(context.min_date, context.max_date)

      assert generated_ranges.start_month_range.first == context.min_date
      assert generated_ranges.start_month_range.last == Date.add(context.max_date, -1)
    end

    test "should produce starting_day from min to end of min month", context do
      generated_ranges = generate_dates(context.min_date, context.max_date)

      assert generated_ranges.start_day_range.first == context.min_date
      assert generated_ranges.start_day_range.last == Date.end_of_month(context.min_date)
    end

    test "should produce ending_month from min + 1 day to max", context do
      generated_ranges = generate_dates(context.min_date, context.max_date)

      assert generated_ranges.end_month_range.first == Date.add(context.min_date, 1)
      assert generated_ranges.end_month_range.last == context.max_date
    end

    test "should produce ending_day from min + 1 day to end of min month", context do
      generated_ranges = generate_dates(context.min_date, context.max_date)

      assert generated_ranges.end_day_range.first == Date.add(context.min_date, 1)
      assert generated_ranges.end_day_range.last == Date.end_of_month(context.min_date)
    end
  end

  describe "Generating date sets (focused_start_date): " do
    setup [:setup_date_range, :setup_simple_focused_dates]

    test "should produce starting_day from beginning of focused month to end of focused month",
         context do
      generated_ranges =
        generate_dates(context.min_date, context.max_date, context.focused_start_date)

      assert generated_ranges.start_day_range.first ==
               Date.beginning_of_month(context.focused_start_date)

      assert generated_ranges.start_day_range.last ==
               Date.end_of_month(context.focused_start_date)
    end

    test "should start at min_date if start of month earlier", context do
      focused_start_date = Date.add(context.min_date, -1)
      generated_ranges = generate_dates(context.min_date, context.max_date, focused_start_date)

      assert generated_ranges.start_day_range.first == context.min_date
      assert generated_ranges.start_day_range.last == Date.end_of_month(context.min_date)
    end
  end

  describe "Generating date sets (focused_end_date): " do
    setup [:setup_date_range, :setup_simple_focused_dates]

    test "should produce ending_day from beginning of focused month to end of focused month",
         context do
      generated_ranges =
        generate_dates(
          context.min_date,
          context.max_date,
          context.focused_start_date,
          context.focused_end_date
        )

      assert generated_ranges.end_day_range.first ==
               Date.beginning_of_month(context.focused_end_date)

      assert generated_ranges.end_day_range.last == Date.end_of_month(context.focused_end_date)
    end

    test "should end at (max_date + 1) if end of month later", context do
      focused_end_date = Date.add(context.max_date, 2)

      generated_ranges =
        generate_dates(
          context.min_date,
          context.max_date,
          context.focused_start_date,
          focused_end_date
        )

      # Max end date is allowed to be one greater than max-date
      assert generated_ranges.end_day_range.last == Date.add(context.max_date, 1)
    end

    test "should show only months from (focused_start_date + 1) to max_date", context do
      generated_ranges =
        generate_dates(
          context.min_date,
          context.max_date,
          context.focused_start_date,
          context.focused_end_date
        )

      assert generated_ranges.end_month_range.first == Date.add(context.focused_start_date, 1)
    end
  end

  defp setup_date_range(_) do
    min_date = Faker.Date.between(~D[2022-02-01], ~D[2022-05-01])
    max_date = Faker.Date.between(~D[2022-10-01], ~D[2022-12-01])

    %{
      min_date: min_date,
      max_date: max_date
    }
  end

  defp setup_simple_focused_dates(_) do
    # Avoid edge cases by having distant from min and max
    focused_start_date = Faker.Date.between(~D[2022-06-01], ~D[2022-07-01])
    focused_end_date = Faker.Date.between(~D[2022-08-01], ~D[2022-09-01])

    %{
      focused_start_date: focused_start_date,
      focused_end_date: focused_end_date
    }
  end
end
