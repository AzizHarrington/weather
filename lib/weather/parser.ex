defmodule Weather.Parser do
  def parse_weather_data({:ok, data}) do
    %Weather{
      credit: find("credit", data),
      location: find("location", data),
      time: find("observation_time", data),
      temp: find("temperature_string", data),
      weather: find("weather", data),
      humidity: find("relative_humidity", data),
      wind: find("wind_string", data),
      pressure: find("pressure_string", data),
      dewpoint: find("dewpoint_string", data),
      visibility: find("visibility_mi", data)
    }
  end

  defp find(element, data) do
    %{ "result" => result } = Regex.named_captures(
      ~r/\<#{element}\>(?<result>.*)\<\/#{element}\>/,
      data
    )
    result
  end
end
