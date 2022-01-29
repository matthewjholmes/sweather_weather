class Location
  attr_reader :latitude, :longitude

  def initialize(data)
    # require "pry"; binding.pry
    @latitude  = data[:results].first[:locations].first[:displayLatLng][:lat]
    @longitude = data[:results].first[:locations].first[:displayLatLng][:lng]
  end
end
