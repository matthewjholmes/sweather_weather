class OpenLibraryService

  def self.book_search_by_location(location, quantity)
    response = conn.get("search.json") do |p|
      p.params['q'] = location
      p.params['limit'] = quantity
    end
    parse(response)
  end

  private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://openlibrary.org")
  end

end
