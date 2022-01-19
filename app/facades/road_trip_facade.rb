class RoadTripFacade

  def self.generate_road_trip(locations)
    # require "pry"; binding.pry
    directions = MapquestFacade.get_directions(locations)
    forecast = WeatherFacade.get_weather(lat: directions.end_latitude, lon: directions.end_longitude)
    #forecast needs to be in the future (based on eta)
    RoadTrip.new(directions, forecast)
  end

end
