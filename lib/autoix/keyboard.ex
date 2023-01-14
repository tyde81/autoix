defmodule Autoix.Keyboard do
  alias Autoix.Native

  def key_down(key) when is_atom(key) do
    Native.key_down(Atom.to_string(key))

    {:ok, {key}}
  end

  def key_down(_) do
    {:error, "invalid type"}
  end

  def key_up(key) when is_atom(key) do
    Native.key_up(Atom.to_string(key))

    {:ok, {key}}
  end

  def key_up(_) do
    {:error, "invalid type"}
  end

  def key_click(key) when is_atom(key) do
    Native.key_click(Atom.to_string(key))

    {:ok, {key}}
  end

  def key_click(_) do
    {:error, "invalid type"}
  end

  def write(text) when is_binary(text) do
    Native.key_sequence_parse(text)

    {:ok, {text}}
  end

  def write(_) do
    {:error, "invalid type"}
  end
end
