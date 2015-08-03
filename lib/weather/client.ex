defmodule Weather.Client do
  def get_weather_data(code) do
    make_url(code)
    |> HTTPoison.get
    |> handle_response
  end

  @endpoint Application.get_env(:weather, :weather_url)

  def make_url(code) do
    "#{@endpoint}/#{code}.xml"
  end

  def handle_response(%{status_code: 200, body: body}) do
    { :ok, body }
  end

  def handle_response(%{status_code: status, body: body}) do
    { :error, body }
  end
end
