class Direction
  attr_reader :id,
              :origin,
              :destination,
              :end_latitude,
              :end_longitude,
              :travel_time

  # :travel_time_seconds

  def initialize(data)
    @id = nil
    @origin = origin(data[:route][:locations].first[:adminArea5],
                     data[:route][:locations].first[:adminArea3])
    @destination = destination(data[:route][:locations].last[:adminArea5],
                               data[:route][:locations].last[:adminArea3])
    @end_latitude = data[:route][:locations].last[:displayLatLng][:lat]
    @end_longitude = data[:route][:locations].last[:displayLatLng][:lng]
    @travel_time = travel_time(data[:route][:realTime])
    # @travel_time_seconds = directions[:route][:realTime]
  end

  def origin(city, state)
    "#{city}, #{state}"
  end

  def destination(city, state)
    "#{city}, #{state}"
  end

  def travel_time(travel_time_seconds)
    # handle errors; must be an integer
    hours = travel_time_seconds / 3600
    minutes = travel_time_seconds / 60 % 60

    if hours == 0
      "#{minutes} minutes"
    elsif hours == 1
      "#{hours} hour, #{minutes} minutes"
    else
      "#{hours} hours, #{minutes} minutes"
    end
  end
end
