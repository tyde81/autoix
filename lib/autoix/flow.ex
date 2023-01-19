defmodule Autoix.Flow do
  require Logger

  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__)

      Module.register_attribute(__MODULE__, :config, [])
      Module.register_attribute(__MODULE__, :flux_name, [])
      Module.register_attribute(__MODULE__, :tasks, accumulate: true)

      @config [run: true]

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(env) do
    quote do
      def run, do: each_run(unquote(env.file), @tasks, __MODULE__)
      def get_config, do: @config
    end
  end

  defmacro task(title, opts \\ [], do: do_block) do
    title_id = String.to_atom(title)

    quote do
      import unquote(Autoix.Mouse)
      import unquote(Autoix.Keyboard)
      import unquote(Autoix.Utils)

      @tasks {unquote(title_id), unquote(title), unquote(opts)}
      def unquote(title_id)(), do: unquote(do_block)
    end
  end

  def each_run(file, tasks, module) do
    [flow_name | _t] = Path.split(file) |> Enum.reverse()

    tasks = tasks |> Enum.filter(fn {_fn_name, _title, opts} -> opts[:run] !== false end)

    Logger.info("======= #{flow_name} =======", ansi_color: :green)

    tasks
    |> Enum.reverse()
    |> Enum.each(fn task -> apply_function(module, task) end)
  end

  def apply_function(module, {fn_name, title, _opts}) do
    case apply(module, fn_name, []) do
      {:error, reason} ->
        Logger.error("#{title} failed.")

        Logger.error(reason)

      _ ->
        Logger.log(:notice, "#{title} was executed succesfully.")
    end
  end
end
