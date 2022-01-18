class RoadTripFacade

  def self.generate_road_trip(road_trip_params)
    directions = MapquestFacade.get_directions(road_trip_params)
    forecast = WeatherFacade.get_weather(lat: directions.end_latitude, lon: directions.end_longitude)
    RoadTrip.new(directions, forecast)
  end

end
