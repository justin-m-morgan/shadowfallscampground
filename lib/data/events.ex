defmodule Shadowfallscampground.Data.Events do
  @moduledoc """
  Functions and struct definition for events
  """
  defstruct name: "", theme: "", date: "", description: "", icon: "information", icon_classes: ""

  def events_listing() do
    [
      # %__MODULE__{
      #   name: "Easter",
      #   theme: "Unofficial Season Opening",
      #   date: NaiveDateTime.new!(2022, 4, 15, 21, 0, 0),
      #   description:
      #     "Just an early opportunity to air out the camping gear. The campground will only be open on weekends until May 13th",
      #   icon: "easter"
      # },
      %__MODULE__{
        name: "Season Opening",
        theme: "No Event",
        date: Date.new!(2022, 5, 13),
        description: "Opening weekend. ",
        icon: "hand"
      },
      %__MODULE__{
        name: "Victoria Day",
        theme: "Welcome Back BBQ",
        date: Date.new!(2022, 5, 21),
        description:
          "Join your fellow campers for a burger and smokey at the clubhouse on Saturday afternoon.",
        icon: "burger"
      },
      %__MODULE__{
        name: "Canada Day",
        theme: "Disco Dance",
        date: Date.new!(2022, 7, 2),
        description:
          "Dust off your dancing shoes and iron your bell-bottoms. And don't miss out on the 'More Fun' Punch",
        icon: "disco"
      },
      %__MODULE__{
        name: "BC Day",
        theme: "Chilli Cookoff",
        date: Date.new!(2022, 7, 30),
        description:
          "All campers are invited to join the competition for a spot on the coveted 'Plaque of Chilli Champions'.",
        icon: "cookpot"
      },
      %__MODULE__{
        name: "Labour Day",
        theme: "Pig Roast",
        date: Date.new!(2022, 9, 3),
        description: "Watch the pig go round and round all day until dinner time.",
        icon: "pig"
      },
      %__MODULE__{
        name: "Season Close",
        theme: "No Event",
        date: Date.new!(2022, 9, 15),
        description:
          "Last call for camping. We may stay open later than this if there is continued demand and the weather cooperates.",
        icon: "hand"
      }
    ]
  end
end
