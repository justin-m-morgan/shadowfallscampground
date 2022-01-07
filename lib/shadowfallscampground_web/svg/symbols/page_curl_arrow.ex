defmodule ShadowfallscampgroundWeb.Svg.Symbols.PageCurlArrow do
  @moduledoc false

  alias ShadowfallscampgroundWeb.Svg.SymbolTemplate

  use Surface.Component

  def render(assigns) do
    ~F"""
    <SymbolTemplate id="page_curl_arrow" viewBox="0 0 512 512">
      <path
        id="BG_bottom_right"
        d="M511.843,0.576l-511.409,511.871l512.918,0.281l-1.509,-512.152Z"
        style="fill:#cacaca;stroke:#000;stroke-opacity:0.44;stroke-width:4px;"
      />
      <path
        id="Arrow"
        d="M454.731,216.086l46.507,142.305c4.071,12.456 -8.511,23.919 -20.871,18.604l-47.874,-20.585c-41.607,93.732 -92.98,160.153 -184.015,121.009c-36.743,-15.799 -63.162,-54.665 -71.159,-88.507c-2.496,-10.561 9.864,-18.768 18.222,-11.676c75.286,63.883 115.167,34.576 155.61,-55.802l-52.575,-22.607c-12.379,-5.323 -12.682,-22.34 -0.854,-27.947l135.284,-64.135c8.51,-4.034 18.795,0.378 21.725,9.341Z"
        style="fill-rule:nonzero;"
      />
      <path
        id="BG_top_left"
        d="M-4.207,515.962l1.444,-516.807l514.522,-0.711l-515.966,517.518Z"
        style="stroke:#000;stroke-opacity:0.44;stroke-width:4px; opacity: 0;"
      />
      <path
        id="PageCurl"
        class="fill-gray-100"
        d="M-0.281,512.077c0,0 214.993,-318.021 62.763,-435.463l448.864,-76.271l-511.627,511.734Z"
      />
    </SymbolTemplate>
    """
  end
end
