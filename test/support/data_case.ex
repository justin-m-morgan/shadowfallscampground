defmodule Shadowfallscampground.DataCase do
  @moduledoc """
  This module defines the setup for tests requiring
  access to the application's data layer.

  You may define functions here to be used as helpers in
  your tests.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use Shadowfallscampground.DataCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnitProperties
      use Oban.Testing, repo: Shadowfallscampground.Repo
      alias Shadowfallscampground.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Shadowfallscampground.DataCase
    end
  end

  setup tags do
    pid =
      Ecto.Adapters.SQL.Sandbox.start_owner!(Shadowfallscampground.Repo, shared: not tags[:async])

    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    :ok
  end

  @doc """
  A helper that transforms changeset errors into a map of messages.

      assert {:error, changeset} = Accounts.create_user(%{password: "short"})
      assert "password is too short" in errors_on(changeset).password
      assert %{password: ["password is too short"]} = errors_on(changeset)

  """
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end

  @doc """
  Checks whether all of the keys/values match in two maps/structs.
  """
  def match_keys(map1, map2, keys, opts \\ [])

  def match_keys(map1, map2, keys, opts) when is_struct(map1),
    do: match_keys(Map.from_struct(map1), map2, keys, opts)

  def match_keys(map1, map2, keys, opts) when is_struct(map2),
    do: match_keys(map1, Map.from_struct(map2), keys, opts)

  def match_keys(map1, map2, keys, opts) do
    cast_string_values = opts[:cast_keys_to_strings] || []

    keys
    |> Enum.all?(maybe_cast_string_values(map1, map2, cast_string_values))
  end

  defp maybe_cast_string_values(map1, map2, to_cast_keys) do
    fn key ->
      maybe_cast_atom_to_string(map1[key], key, to_cast_keys) ==
        maybe_cast_atom_to_string(map2[key], key, to_cast_keys)
    end
  end

  defp maybe_cast_atom_to_string(value, key, to_cast_keys)

  defp maybe_cast_atom_to_string(value, key, to_cast_keys) when is_atom(value) do
    case key in to_cast_keys do
      true -> Atom.to_string(value)
      false -> value
    end
  end

  defp maybe_cast_atom_to_string(value, _key, _to_cast_keys), do: value
end
