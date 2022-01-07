defmodule ShadowfallscampgroundWeb.Svg.Symbols.Hummingbird do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="hummingbird" viewBox="0 0 553 418">
      <g
        transform="matrix(1,0,0,1,-3718,-117)"
        style="fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;"
      >
        <g id="Icon" transform="matrix(1,0,0,1,761.738,-0.566406)">
          <rect x="2898.7" y="0.566" width="711.68" height="1555.9" style="fill:none;" />
          <g class="logo" transform="matrix(4.07542,0,0,4.07542,4719.88,-702.516)">
            <g class="logo__wing--0" transform="matrix(0.523243,-0.6477,0.729291,0.589157,-444.467,239.562)">
              <g opacity="0.6">
                <clipPath id="_clip1">
                  <rect x="26.779" y="4.49" width="27.037" height="71.459" />
                </clipPath>
                <g clip-path="url(#_clip1)">
                  <path
                    d="M41.216,4.49L53.816,75.949C53.816,75.949 33.062,69.748 28.286,44.985C23.622,20.801 30.294,17.414 41.216,4.49"
                    style="fill:rgb(255,0,0);fill-rule:nonzero;"
                  />
                </g>
              </g>
            </g>
            <g
              class="logo__wing--1"
              transform="matrix(0.381751,-0.739976,0.833192,0.429841,-441.756,255.961)"
            >
              <g opacity="0.6">
                <clipPath id="_clip2">
                  <rect x="26.779" y="4.49" width="27.037" height="71.459" />
                </clipPath>
                <g clip-path="url(#_clip2)">
                  <path
                    d="M41.216,4.49L53.816,75.949C53.816,75.949 33.062,69.748 28.286,44.985C23.622,20.801 30.294,17.414 41.216,4.49"
                    style="fill:rgb(255,170,82);fill-rule:nonzero;"
                  />
                </g>
              </g>
            </g>
            <g
              class="logo__wing--2"
              transform="matrix(0.215505,-0.804274,0.905589,0.242652,-433.436,271.894)"
            >
              <g opacity="0.6">
                <clipPath id="_clip3">
                  <rect x="26.779" y="4.49" width="27.037" height="71.459" />
                </clipPath>
                <g clip-path="url(#_clip3)">
                  <path
                    d="M41.216,4.49L53.816,75.949C53.816,75.949 33.062,69.748 28.286,44.985C23.622,20.801 30.294,17.414 41.216,4.49"
                    style="fill:rgb(255,233,22);fill-rule:nonzero;"
                  />
                </g>
              </g>
            </g>
            <g
              class="logo__wing--3"
              transform="matrix(2.92967e-16,-0.832646,0.937535,2.92967e-16,-419.316,286.642)"
            >
              <g opacity="0.6">
                <clipPath id="_clip4">
                  <rect x="26.779" y="4.49" width="27.037" height="71.459" />
                </clipPath>
                <g clip-path="url(#_clip4)">
                  <path
                    d="M41.216,4.49L53.816,75.949C53.816,75.949 33.062,69.748 28.286,44.985C23.622,20.801 30.294,17.414 41.216,4.49"
                    style="fill:rgb(59,210,61);fill-rule:nonzero;"
                  />
                </g>
              </g>
            </g>
            <g
              class="logo__wing--4"
              transform="matrix(-0.215505,-0.804274,0.905589,-0.242652,-402.979,296.824)"
            >
              <g opacity="0.6">
                <clipPath id="_clip5">
                  <rect x="26.779" y="4.49" width="27.037" height="71.459" />
                </clipPath>
                <g clip-path="url(#_clip5)">
                  <path
                    d="M41.216,4.49L53.816,75.949C53.816,75.949 33.062,69.748 28.286,44.985C23.622,20.801 30.294,17.414 41.216,4.49"
                    style="fill:rgb(0,156,205);fill-rule:nonzero;"
                  />
                </g>
              </g>
            </g>
            <g
              class="logo__wing--5"
              transform="matrix(-0.447292,-0.702302,0.790772,-0.503638,-383.839,302.946)"
            >
              <g opacity="0.6">
                <clipPath id="_clip6">
                  <rect x="26.779" y="4.49" width="27.037" height="71.459" />
                </clipPath>
                <g clip-path="url(#_clip6)">
                  <path
                    d="M41.216,4.49L53.816,75.949C53.816,75.949 33.062,69.748 28.286,44.985C23.622,20.801 30.294,17.414 41.216,4.49"
                    style="fill:rgb(157,134,222);fill-rule:nonzero;"
                  />
                </g>
              </g>
            </g>
            <g class="logo__body" transform="matrix(0.937535,0,0,0.937535,-413.959,190.145)">
              <path d="M27.252,104.5C27.252,104.5 49.039,48.881 64.617,36.27C70.303,31.667 77.106,35.325 87.09,37.353C101.111,40.2 115.307,41.695 124.183,43.31C124.183,43.31 86.818,38.437 84.111,40.602C81.404,42.768 77.41,48.282 69.22,75.259C64.795,89.829 57.577,92.045 27.252,104.5" />
            </g>
          </g>
        </g>
      </g>
    </SymbolTemplate>
    """
  end
end
