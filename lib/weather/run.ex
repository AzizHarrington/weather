defmodule Weather.Run do
  import Weather.Client, only: [ get_weather_data: 1 ]
  import Weather.Parser, only: [ parse_weather_data: 1 ]
  import Weather.Formatter, only: [ format_weather_data: 1 ]

  def main(argv) do
    OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    |> parse_args
    |> get_weather_data
    |> parse_weather_data
    |> format_weather_data
    |> IO.puts
  end

  def parse_args({[help: true], _, _}) do
    IO.puts "Here is your help. Was this helpful?"
  end

  def parse_args({_, [<< a, b, c >>], _}) do
    "K" <> String.upcase <<a, b, c>>
  end

  def parse_args(_) do
    parse_args{[help: true], [], []}
  end
end
