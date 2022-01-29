class MapquestFacade
  def self.get_coords(location)
    data = MapquestService.get_coords(location)
    Location.new(data)
  end

  def self.get_directions(origin, destination)
    # require "pry"; binding.pry
    data = MapquestService.get_directions(origin, destination)
    Direction.new(data)
  end
end
