defmodule ShadowfallscampgroundWeb.Forms.ErrorSummary do
  @moduledoc """
  Error summary component (for end of forms)
  """
  use ShadowfallscampgroundWeb, :component

  @doc "Key/lable pairs for errors to summarize"
  prop error_key_list, :keyword, required: true

  @doc "Changeset of form"
  prop changeset, :map, required: true

  def render(assigns) do
    ~F"""
    <h3 class="font-bold">Please complete/correct the following:
    </h3>
    <ul>
      {#for {field, label} <- @error_key_list}
        {#if @changeset.errors[field]}
          <li>{label}: <Surface.Components.Form.ErrorTag field={field} /></li>
        {/if}
      {/for}
    </ul>
    """
  end
end
