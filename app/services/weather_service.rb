class WeatherService

  def self.get_weather(latitude, longitude)
    response = conn.get('/data/2.5/onecall') do |p|
      p.params['lat'] = latitude
      p.params['lon'] = longitude
      p.params['exclude'] = 'minutely, alerts'
      p.params['units'] = 'imperial'
    end
    parse(response)
  end

  private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.openweathermap.org",
      params: { appid: ENV['OPEN_WEATHER_API_KEY'] }
    )
  end

end
