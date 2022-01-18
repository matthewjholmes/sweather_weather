class MapquestService

  def self.get_coords(location)
    response = conn.get('/geocoding/v1/address') do |p|
      p.params['location'] = location
    end
    parse(response)
  end

  def self.get_directions(locations)
    response = conn.get('/directions/v2/route') do |p|
      p.params['from'] = locations[:origin]
      p.params['to']   = locations[:destination]
    end
    parse(response)
  end

  # private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com",
      params: { key: ENV['MAPQUEST_API_KEY'] }
    )
  end

end
