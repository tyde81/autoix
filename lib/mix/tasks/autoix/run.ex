defmodule Mix.Tasks.Autoix.Run do
  use Mix.Task

  @shortdoc "This function run all flows."
  def run(_) do
    cwd = File.cwd!()
    files = Path.wildcard("#{cwd}/lib/flows/*.ex")
    ms = :os.system_time(:millisecond)

    modules =
      files
      |> Enum.map(fn f ->
        f
        |> Path.split()
        |> Enum.reverse()
        |> hd
        |> String.replace(~r/\.ex$/, "")
        |> Macro.camelize()
      end)

    modules |> Enum.map(&load/1) |> Task.await_many() |> show_message(ms)
  end

  def load(module) do
    Task.async(fn ->
      module = Module.concat("Flows", module)

      config = apply(module, :get_config, [])

      if config[:run] do
        case Code.ensure_compiled(module) do
          {:module, _module} ->
            apply(module, :run, [])

          {:error, :nofile} ->
            Mix.shell().info("No flow was found.")
        end
      end
    end)
  end

  def show_message(_, ms) do
    Mix.shell().info("""


    Flow executed successfully, in #{:os.system_time(:millisecond) - ms} ms

    """)
  end
end
