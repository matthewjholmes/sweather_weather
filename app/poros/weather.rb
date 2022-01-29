class Weather
  attr_reader :id,
              :current,
              :daily,
              :hourly

  def initialize(data, travel_seconds = nil)
    @id = nil
    @current = current_weather(data)
    @daily = five_day_weather(data)
    @hourly = eight_hour_weather(data)
  end

  def current_weather(data)
    current = data[:current]
    {
      datetime: Time.at(current[:dt]),
      sunrise: Time.at(current[:sunrise]),
      sunset: Time.at(current[:sunset]),
      temperature: current[:temp],
      feels_like: current[:feels_like],
      humidity: current[:humidity],
      uvi: current[:uvi],
      visibility: current[:visibility],
      conditions: current[:weather][0][:description],
      icon: current[:weather][0][:icon]
    }
  end

  def five_day_weather(data)
    data[:daily][0..4].map do |day|
      {
        date: Time.at(day[:dt]).strftime('%Y-%m-%d'),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def eight_hour_weather(data)
    data[:hourly][0..7].map do |hour|
      {
        time: Time.at(hour[:dt]).strftime('%I:%M %p'),
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end

  def weather_at_eta(travel_time_seconds)
    travel_hours = travel_time_seconds / 3600
    {
      conditions: hourly[travel_hours][:conditions],
      temperature: hourly[travel_hours][:temperature]
    }
  end
end
