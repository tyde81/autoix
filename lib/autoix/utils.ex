defmodule Autoix.Utils do
  alias Autoix.Flow

  def sleep(ms) when is_number(ms) do
    Process.sleep(ms)
  end

  def sleep(_) do
    {:error, "invalid type"}
  end

  defmacro goto(fn_name, module) when is_binary(fn_name) and not is_nil(module) do
    fun = String.to_atom(fn_name)

    quote do
      case Keyword.has_key?(unquote(module).__info__(:functions), unquote(fun)) do
        true -> Flow.apply_function(unquote(module), {unquote(fun), unquote(fn_name), []})
        false -> raise("invalid task")
      end
    end
  end

  defmacro goto(fn_name) when is_binary(fn_name) do
    fun = String.to_atom(fn_name)

    quote do
      case Keyword.has_key?(__ENV__.module.__info__(:functions), unquote(fun)) do
        true ->
          Flow.apply_function(__ENV__.module, {unquote(fun), unquote(fn_name), []})

        false ->
          raise("invalid task")
      end
    end
  end
end
