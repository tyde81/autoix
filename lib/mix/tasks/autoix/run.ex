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
        module =
          path
          |> Path.split()
          |> Enum.reverse()
          |> hd
          |> String.replace(~r/\.ex$/, "")
          |> Macro.camelize()

        {module, path}
      end)

    modules |> Enum.map(&load/1) |> Task.await_many() |> show_message(ms)
  end

  def load({module, path}) do
    Task.async(fn ->
      module = Module.concat("Flows", module)

      case Code.ensure_compiled(module) do
        {:module, _module} ->
          apply_function(module)

        {:error, :nofile} ->
          {{:module, module, _, _}, _} = Code.eval_file(path)

          apply_function(module)
      end
    end)
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
