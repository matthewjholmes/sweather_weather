class WeatherFacade
  def self.get_weather(location)
    coords = MapquestFacade.get_coords(location)
    # Handle invalid location, such as return coords if coords != something
    weather_data = WeatherService.get_weather(coords.latitude, coords.longitude)
    # Handle error in weather_data
    # require "pry"; binding.pry
    Weather.new(weather_data)
  end
end
