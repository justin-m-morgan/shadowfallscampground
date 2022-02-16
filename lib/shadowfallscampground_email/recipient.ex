defmodule ShadowfallscampgroundEmail.Recipient do
  @moduledoc """
  Struct for email target
  """
  @enforce_keys [:name, :email]
  defstruct [:name, :email]

  def new({name, email}), do: new(name, email)

  def new(name, email) do
    %__MODULE__{
      name: name,
      email: email
    }
  end
end
