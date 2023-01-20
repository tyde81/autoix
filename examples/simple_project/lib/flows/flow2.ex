defmodule Flows.Flow2 do
  use Autoix.Flow

  @name "flow 2"
  @run false

  task "1.0" do
    move(0, 0)
  end
end
