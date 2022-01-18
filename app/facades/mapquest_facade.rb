class MapquestFacade

  def self.get_coords(location)
    data = MapquestService.get_coords(location)
    # if data[:info][:messages]
    #   ErrorSerializer.new(
    #     messages: data[:info][:messages],
    #     status: data[:info][:statuscode]
    #   )
    # else
      Location.new(data)
    # end
  end

  def self.get_directions(locations)
    data = MapquestService.get_directions(locations)
    # handle error
    Directions.new(data)
  end
end
