class RoadTripFacade
  def self.generate_road_trip(origin, destination)
    directions = MapquestFacade.get_directions(origin, destination)
    forecast = WeatherFacade.get_weather(destination)
    RoadTrip.new(directions, forecast)
  end
end
