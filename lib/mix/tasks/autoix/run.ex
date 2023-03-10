defmodule Mix.Tasks.Autoix.Run do
  use Mix.Task

  @shortdoc "This function run all flows."
  def run(_) do
    cwd = File.cwd!()
    files = Path.wildcard("#{cwd}/lib/flows/*.ex")
    ms = :os.system_time(:millisecond)

    modules =
      files
      |> Enum.map(fn path ->
        precompile(path)
      end)

    modules |> Enum.each(&load/1) |> show_message(ms)
  end

  def precompile(path) do
    module =
      path
      |> Path.split()
      |> Enum.reverse()
      |> hd
      |> String.replace(~r/\.ex$/, "")
      |> Macro.camelize()

    case Code.ensure_compiled(Module.concat("Flows", module)) do
      {:error, :nofile} -> Code.compile_file(path)
      _ -> nil
    end

    {module, path}
  end

  def load({module, path}) do
    Task.async(fn ->
      module = Module.concat("Flows", module)

      case Code.ensure_compiled(module) do
        {:module, _module} ->
          apply_function(module)

        {:error, :nofile} ->
          [{module, _binary}] = Code.compile_file(path)

          load({module, path})
      end
    end)
    |> Task.await()
  end

  def apply_function(module) do
    config = apply(module, :get_config, [])

    if config[:run] do
      apply(module, :run, [])
    end
  end

  def show_message(_, ms) do
    Mix.shell().info("""


    Flow executed successfully, in #{:os.system_time(:millisecond) - ms} ms

    """)
  end
end
