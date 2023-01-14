defmodule Autoix.Api do
  defmacro __using__(opts) do
    quote do
      import unquote(__MODULE__)

      Module.register_attribute(__MODULE__, :flows, [])

      @flows unquote(opts[:flows])
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        Enum.each(@flows, fn module -> module.run() end)
      end
    end
  end
end
