class BookSearchFacade

  def self.book_search_by_location(location, quantity)
    books = OpenLibraryService.book_search_by_location(location, quantity)
    coords = MapquestFacade.get_coords(location)
    weather_data = WeatherService.get_weather(coords.latitude, coords.longitude)
    BookSearchResult.new(books, weather_data)
  end

end
