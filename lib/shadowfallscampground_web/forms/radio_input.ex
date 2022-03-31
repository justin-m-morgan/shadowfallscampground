defmodule ShadowfallscampgroundWeb.Forms.RadioInput do
  @moduledoc """
  Email Input
  """
  use ShadowfallscampgroundWeb, :component

  alias Surface.Components.Form
  alias ShadowfallscampgroundWeb.Forms.FormInput

  @doc "Field name"
  prop name, :atom, required: true

  @doc "Fieldset Label text"
  prop label, :string, required: true

  @doc "Bug fix for misbehaving checked values"
  prop checked_override, :atom, default: false

  @doc "Mappings for options"
  prop mappings, :list, default: nil

  @doc "Module enum mappings are declared in"
  prop schema_module, :atom

  @doc "Toggle for displaying icons"
  prop display_icon, :boolean, default: true

  @doc "CSS classes for grid container"
  prop class, :css_class

  def render(assigns) do
    ~F"""
    <FormInput name={@name} label={@label}>
      <div class={"grid grid-cols-2 gap-1 overflow-hidden rounded-md", @class}>
        {#for {value, label} <- @mappings || humanized_options(@schema_module, @name)}
          <div class={
            "overflow-hidden",
            "",
            "w-full flex"
          }>
            {#if @checked_override}
              <Form.RadioButton
                id={"#{@name}-#{value}"}
                value={value}
                checked={value == @checked_override}
                class="sr-only peer"
              />
            {#else}
              <Form.RadioButton id={"#{@name}-#{value}"} value={value} class="sr-only peer" />
            {/if}
            <label
              for={"#{@name}-#{value}"}
              class={
                "flex flex-col items-center justify-center flex-grow",
                "bg-primary-500 text-gray-50 font-bold text-center",
                "py-3 px-4",
                "hover:bg-primary-600",
                "cursor-pointer",
                "peer-checked:bg-primary-800"
              }
            >
              <Svg.IconSymbol :if={@display_icon} size={:sm} name={Atom.to_string(value)} />
              <span>{label}</span>
            </label>
          </div>
        {/for}
      </div>
    </FormInput>
    """
  end

  defp humanized_options(module, key) do
    module
    |> Ecto.Enum.mappings(key)
    |> Enum.map(fn {key, value} -> {key, humanize_value(value)} end)
  end

  defp humanize_value("rv"), do: "RV"
  defp humanize_value(:rv), do: "RV"
  defp humanize_value(value), do: Phoenix.Naming.humanize(value)
end
