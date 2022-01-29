class RoadTrip
  attr_reader :id, :origin, :destination, :travel_time, :weather_at_eta

  def initialize(directions, forecast)
    @id = nil
    if forecast.nil?
      @origin = directions[:origin].sub(',', ', ')
      @destination = directions[:destination].sub(',', ', ')
      @travel_time = 'impossible'
      @weather_at_eta = {}
    else
      @origin = directions.origin
      @destination = directions.destination
      @travel_time = directions.travel_time
      @weather_at_eta = forecast.weather_at_eta(directions.travel_time_seconds)
      # require "pry"; binding.pry
    end
  end
end
