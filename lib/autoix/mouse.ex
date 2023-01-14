defmodule Autoix.Mouse do
  alias Autoix.Native

  def move(x, y) when is_number(x) and is_number(y) do
    Native.mouse_move_to(x, y)

    {:ok, {x, y}}
  end

  def move(_, _) do
    {:error, "invalid type"}
  end

  def move_relative(x, y) when is_number(x) and is_number(y) do
    Native.mouse_move_relative(x, y)

    {:ok, {x, y}}
  end

  def move_relative(_, _) do
    {:error, "invalid type"}
  end

  def mouse_up(button) when is_atom(button) do
    Native.mouse_up(Atom.to_string(button))

    {:ok, {button}}
  end

  def mouse_up(_) do
    {:error, "invalid type"}
  end

  def mouse_down(button) when is_atom(button) do
    Native.mouse_down(Atom.to_string(button))

    {:ok, {button}}
  end

  def mouse_down(_) do
    {:error, "invalid type"}
  end

  def click(button) when is_atom(button) do
    Native.mouse_click(Atom.to_string(button))

    {:ok, {button}}
  end

  def click(_) do
    {:error, "invalid type"}
  end
end
