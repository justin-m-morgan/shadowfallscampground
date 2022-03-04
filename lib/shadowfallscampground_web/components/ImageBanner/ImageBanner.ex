defmodule ShadowfallscampgroundWeb.Components.ImageBanner do
  @moduledoc """
  Container component for displaying multiple images
  """
  use ShadowfallscampgroundWeb, :component

  @doc "Custom image list"
  prop images, :list, default: nil

  @doc "Banner grouping from hardcoded chunks"
  prop banner_number, :integer, default: 1

  @doc "Number of images per banner"
  prop chunk_size, :integer, default: 4

  def render(assigns) do
    ~F"""
    <div class="min-h-96 grid grid-cols-2 xl:grid-cols-4" data-test="image-banner">
      {#for {filename, description} <- @images || banners(@banner_number, @chunk_size)}
        <Components.Image src={filename} alt={description} />
      {/for}
    </div>
    """
  end

  defp banners(banner_number, chunk_size) when is_integer(banner_number) do
    [
      {"volleyball_r95tpc.jpg", "Volleball on the green"},
      {"tents_in_two_three_ncszbw.jpg", "Tents in site two and three"},
      {"rver_banquet_ovtyzl.jpg", "Banquet at an RV site"},
      {"hammocks_on_bluff_c5gmgn.jpg", "Hammock at the Rock Bluff"},
      {"valley_from_rockbluff_lsleuc.jpg", "View of the Valley from the Rock Bluff"},
      {"unicorn_on_grass_tmzzdz.jpg", "People riding inflatable unicorn on grass"},
      {"grotto_at_water_level_vfrwj6.jpg", "View of the grotto"},
      {"drag_on_deck_p5342h.jpg", "Guys in drag at disco event"},
      {"bear_pond_sign_qzxxrp.jpg", "View of Bear Pond"},
      {"banquet_people_soczfw.jpg", "Banquent on the grass"},
      {"banquet_in_clubhouse_l1kuqc.jpg", "Banquet in clubhouse"},
      {"central_fire_l4aype.jpg", "People sitting at central campfire"},
      {"disco_dance_fz9yhg.jpg", "People dancing at disco party"},
      {"bear_welcome_statue_vhcewc.jpg", "Bear scultupre holding welcome sign"},
      {"palm_tree_rv_zktvne.jpg", "Neon palm tree in front of RV"},
      {"small_gathering_on_deck_sghjrg.jpg", "People sitting at event on clubhouse deck"}
    ]
    |> Enum.chunk_every(chunk_size)
    |> Enum.at(banner_number - 1)
  end
end
