defmodule Autoix.Utils do
  alias Autoix.Flow

  def sleep(ms) do
    Process.sleep(ms)
  end

  defmacro goto(fn_name, module) do
    fun = String.to_atom(fn_name)

    quote do
      Flow.apply_function(unquote(module), {unquote(fun), unquote(fn_name), []})
    end
  end

  defmacro goto(fn_name) do
    fun = String.to_atom(fn_name)

    quote do
      Flow.apply_function(__ENV__.module, {unquote(fun), unquote(fn_name), []})
    end
  end
end
