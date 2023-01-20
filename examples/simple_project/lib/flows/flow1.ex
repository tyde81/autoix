defmodule Flows.Flow1 do
  use Autoix.Flow

  @name "flow 1"

  task "1.0" do
    move(0, 0)
  end
end
