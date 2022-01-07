defmodule Shadowfallscampground.Data.Events do
  defstruct name: "", theme: "", date: "", description: "", icon: "information", icon_classes: ""

  def events_listing() do
    [
      %__MODULE__{
        name: "Easter",
        theme: "Unofficial Season Opening",
        date: NaiveDateTime.new!(2022, 4, 14, 21, 0, 0),
        description: "Just an early opportunity to air out the camping gear. Potluck dinner.",
        icon: "easter"
      },
      %__MODULE__{
        name: "Victoria Day",
        theme: "Welcome Back BBQ",
        date: NaiveDateTime.new!(2022, 5, 24, 21, 0, 0),
        description:
          "Join your fellow campers for a burger and smokey at the clubhouse on Saturday afternoon.",
        icon: "burger"
      },
      %__MODULE__{
        name: "Canada Day",
        theme: "Disco Dance",
        date: NaiveDateTime.new!(2022, 7, 1, 21, 0, 0),
        description:
          "Dust off your dancing shoes and iron your bell-bottoms. And don't miss out on the 'More Fun' Punch",
        icon: "disco"
      },
      %__MODULE__{
        name: "BC Day",
        theme: "Chilli Cookoff",
        date: NaiveDateTime.new!(2022, 8, 4, 21, 0, 0),
        description:
          "All campers are invited to join the competition for a spot on the coveted 'Plaque of Chilli Champions'.",
        icon: "cookpot"
      },
      %__MODULE__{
        name: "Labour Day",
        theme: "Pig Roast",
        date: NaiveDateTime.new!(2022, 9, 5, 21, 0, 0),
        description: "Watch the pig go round and round all day until dinner time.",
        icon: "pig"
      },
      %__MODULE__{
        name: "Season Close",
        theme: "No Event",
        date: NaiveDateTime.new!(2022, 9, 15, 21, 0, 0),
        description:
          "Last call for camping. We may stay open later than this if there is continued demand and the weather cooperates.",
        icon: "hand"
      }
    ]
  end
end
