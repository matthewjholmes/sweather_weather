class UnsplashService

  def self.get_background_image(query)
    response = conn.get('/search/photos') do |f|
      f.params['query'] = query
    end
    parse(response)
  end


  private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: "https://api.unsplash.com",
      params: { client_id: ENV['UNSPLASH_ACCESS_KEY'] }
    )
  end

end
