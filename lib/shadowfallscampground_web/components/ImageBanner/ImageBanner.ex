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
      {#for filename <- @images || banners(@banner_number, @chunk_size)}
        <Components.Image src={filename} alt={filename} />
      {/for}
    </div>
    """
  end

  defp banners(banner_number, chunk_size) when is_integer(banner_number) do
    ~w/
      volleyball_r95tpc.jpg
      tents_in_two_three_ncszbw.jpg
      rver_banquet_ovtyzl.jpg
      hammocks_on_bluff_c5gmgn.jpg
      valley_from_rockbluff_lsleuc.jpg
      unicorn_on_grass_tmzzdz.jpg
      grotto_at_water_level_vfrwj6.jpg
      drag_on_deck_p5342h.jpg
      bear_pond_sign_qzxxrp.jpg
      banquet_people_soczfw.jpg
      banquet_in_clubhouse_l1kuqc.jpg
      central_fire_l4aype.jpg
      disco_dance_fz9yhg.jpg
      bear_welcome_statue_vhcewc.jpg
      palm_tree_rv_zktvne.jpg
      small_gathering_on_deck_sghjrg.jpg
      /
    |> Enum.chunk_every(chunk_size)
    |> Enum.at(banner_number - 1)
  end
end
