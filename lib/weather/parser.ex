defmodule Weather.Parser do
  def parse_weather_data({:ok, data}) do
    run_regex("temp_f", data)
  end

  defp run_regex(element, data) do
    %{ "result" => result } = Regex.named_captures(
      ~r/\<#{element}\>(?<result>.*)\<\/#{element}\>/,
      data
    )
    result
  end
end
