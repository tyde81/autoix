defmodule Mix.Tasks.Autoix.Run do
  use Mix.Task

  @shortdoc "This function run the script /lib/flows/flow_helper.exs."
  def run(_) do
    {:ok, path} = File.cwd()

    ms = :os.system_time(:millisecond)

    flow_helper = "#{path}/lib/flows/flow_helper.exs"

    Mix.shell().cmd("mix run #{flow_helper}") |> show_message(ms)
  end

  def show_message(0, ms) do
    Mix.shell().info("""


    Flows executed successfully, in #{:os.system_time(:millisecond) - ms} ms

    """)
  end
end
