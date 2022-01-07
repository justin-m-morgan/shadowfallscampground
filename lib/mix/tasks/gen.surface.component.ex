defmodule Mix.Tasks.Gen.Surface.Component do
  @moduledoc """
  A script for generating component template files and their accompanying files (test, surface catalogue, etc)
  """
  @shortdoc "Generate Surface Component"

  @base_path "lib/shadowfallscampground_web/components"
  @module_path "ShadowfallscampgroundWeb.Components"
  @project_name "Shadowfallscampground"

  use Mix.Task

  @impl Mix.Task
  def run([component_name]) do
    common_path = "#{@base_path}/#{component_name}/#{component_name}"

    [
      {".ex", component(@module_path, component_name)},
      {"_test.exs", test(@module_path, component_name, @project_name)},
      {".catalogue.example01.ex", catalogue_example(@module_path, component_name)},
      {".catalogue.playground.ex", catalogue_playground(@module_path, component_name)}
    ]
    |> Enum.each(fn {file_end, contents} ->
      Mix.Generator.create_file(common_path <> file_end, contents)
    end)
  end

  defp component(base_path, component_name) do
    """
    defmodule #{base_path}.#{component_name} do
      @moduledoc \"\"\"

      \"\"\"
      use #{@project_name}Web, :component

      def render(assigns) do
        ~F\"\"\"

        \"\"\"
      end
    end

    """
  end

  defp test(base_path, component_name, project_name) do
    """
    defmodule #{base_path}.#{component_name}Test do
      use #{project_name}.ConnCase, async: true

      alias #{base_path}.#{component_name}

      test "creates a #{component_name} element" do
        html =
          render_surface do
            ~F\"\"\"
            <#{component_name} />
            \"\"\"
          end

        assert html =~ \"\"\"
              #  Has Some Quality
               \"\"\"
      end
    end

    """
  end

  defp catalogue_example(base_path, component_name) do
    """
    defmodule #{base_path}.#{component_name}.Example01 do
      @moduledoc \"\"\"

      \"\"\"

      use Surface.Catalogue.Example,
        subject: #{base_path}.#{component_name},
        height: "480px",
        body: [style: "padding: 1.5rem; background-color: #DDDDDD;"],
        title: ""

      alias #{base_path}.#{component_name}

      def render(assigns) do
        ~F\"\"\"
        <#{component_name} />
        \"\"\"
      end
    end

    """
  end

  defp catalogue_playground(base_path, component_name) do
    """
    defmodule #{base_path}.#{component_name}.Playground do
      use Surface.Catalogue.Playground,
        subject: #{base_path}.#{component_name},
        height: "600px",
        body: [style: "padding: 1.5rem; background-color: #DDDDDD;"]

      data props, :map, default: %{

      }

      def render(assigns) do
        ~F\"\"\"
        <#{component_name} {...@props} />
        \"\"\"
      end
    end

    """
  end
end
