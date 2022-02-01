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

  @doc "Keyword mappings of value/label"
  prop mappings, :keyword, required: true

  def render(assigns) do
    ~F"""
    <FormInput name={@name} label={@label}>
      <div class="flex w-full">
        {#for {value, label} <- @mappings}
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
                "bg-accent-500 text-gray-50 font-bold text-center",
                "inline-block flex-grow",
                "py-3 px-4",
                "hover:bg-accent-600",
                "cursor-pointer",
                "peer-checked:bg-accent-800"
              }
            >
              {label}
            </label>
          </div>
        {/for}
      </div>
    </FormInput>
    """
  end
end
