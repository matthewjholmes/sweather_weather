class MapquestService
  def self.get_coords(location)
    response = conn.get('/geocoding/v1/address') do |p|
      p.params['location'] = location
    end
    parse(response)
  end

  # def self.get_directions(to, from)
  #   response = conn.get('/geocoding/v1/address') do |p|
  #     p.params['to'] = to
  #     p.params['from'] = from
  #   end
  #   parse(response)
  # end

  def self.get_directions(from, to)
    response = conn.get("/directions/v2/route?to=#{to}&from=#{from}")
    parse(response)
  end

  # def self.get_directions(origin, destination)
  #   # require "pry"; binding.pry
  #   response = conn.get('/directions/v2/route') do |p|
  #     p.params['from'] = origin
  #     p.params['to']   = destination
  #     # p.params['from'] = locations[:origin]
  #     # p.params['to']   = locations[:destination]
  #     # p.params['from'] = locations[:params][:origin]
  #     # p.params['to']   = locations[:params][:destination]
  #   end
  #   # require "pry"; binding.pry
  #   parse(response)
  # end

  # private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com',
                params: { key: ENV['MAPQUEST_API_KEY'] })
  end
end
