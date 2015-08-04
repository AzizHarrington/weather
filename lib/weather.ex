defmodule Weather do
  defstruct [
    :credit, :location, :time,
    :weather, :temp, :humidity,
    :wind, :pressure, :dewpoint,
    :visibility
  ]
end
