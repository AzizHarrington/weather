defmodule Weather.Run do
  import Weather.Client, only: [ get_weather_data: 1 ]
  import Weather.Parser, only: [ parse_weather_data: 1 ]

  def main(argv) do
    OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    |> parse_args
    |> get_weather_data
    |> parse_weather_data
    |> (&(IO.puts "todays temp is #{&1}")).()
    IO.puts "finished, thaks"
  end

  def parse_args({[help: true], _, _}) do
    IO.puts "blah blah, here is your help, blah"
  end

  def parse_args({_, [<< a, b, c >>], _}) do
    code = "K" <> String.upcase <<a, b, c>>
    IO.puts "here is your code #{code}, blah blah blag"
    code
  end

  def parse_args(_) do
    parse_args{[help: true], [], []}
  end
end
