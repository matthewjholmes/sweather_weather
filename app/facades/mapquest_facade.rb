class MapquestFacade
  def self.get_coords(location)
    data = MapquestService.get_coords(location)
    Location.new(data)
  end

  def self.get_directions(locations)
    data = MapquestService.get_directions(locations)
    Direction.new(data)
  end
end
