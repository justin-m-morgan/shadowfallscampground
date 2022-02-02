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

  @doc "Mappings for options"
  prop mappings, :keyword, default: nil

  @doc "Module enum mappings are declared in"
  prop schema_module, :atom, required: true

  @doc "Toggle for displaying icons"
  prop display_icon, :boolean, default: true

  def render(assigns) do
    ~F"""
    <FormInput name={@name} label={@label}>
      <div class="flex w-full">
        {#for {value, label} <- @mappings || humanized_options(@schema_module, @name)}
          <div class={
            "overflow-hidden",
            "first:rounded-l-lg last:rounded-r-lg",
            "border-l-2 first:border-0 border-gray-50",
            "w-full flex"
          }>
            <Form.RadioButton id={"#{@name}-#{value}"} value={value} class="sr-only peer" />
            <label
              for={"#{@name}-#{value}"}
              class={
                "flex flex-col items-center justify-center flex-grow",
                "bg-accent-500 text-gray-50 font-bold text-center",
                "py-3 px-4",
                "hover:bg-accent-600",
                "cursor-pointer",
                "peer-checked:bg-accent-800"
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
    |> Enum.map(fn {key, value} -> {key, Phoenix.Naming.humanize(value)} end)
  end
end
