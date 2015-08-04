defmodule Weather.Formatter do
  def format_weather_data(data) do
    """

    Weather for:

    #{data.location}
    #{data.time}

    Current conditions:
    #{data.weather}
    #{data.temp}
    Wind #{data.wind}
    Presure #{data.pressure}
    Dewpoint #{data.dewpoint}
    Visibility #{data.visibility} miles

    Provided by #{data.credit}
    """
  end
end
