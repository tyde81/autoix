defmodule Autoix.Native do
  use Rustler,
    otp_app: :autoix,
    crate: :autoix

  def mouse_move_to(_arg1, _arg2), do: :erlang.nif_error(:nif_not_loaded)
  def mouse_move_relative(_arg1, _arg2), do: :erlang.nif_error(:nif_not_loaded)
  def key_sequence_parse(_arg1), do: :erlang.nif_error(:nif_not_loaded)
  def mouse_click(_arg1), do: :erlang.nif_error(:nif_not_loaded)
  def mouse_down(_arg1), do: :erlang.nif_error(:nif_not_loaded)
  def mouse_up(_arg1), do: :erlang.nif_error(:nif_not_loaded)
  def key_down(_arg1), do: :erlang.nif_error(:nif_not_loaded)
  def key_up(_arg1), do: :erlang.nif_error(:nif_not_loaded)
  def key_click(_arg1), do: :erlang.nif_error(:nif_not_loaded)
end
