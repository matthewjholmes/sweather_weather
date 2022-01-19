class Image
  attr_reader :id, :image

  def initialize(data)
    @id    = nil
    @image = image(data)
  end

  def image(data)
    first_image = data[:results].first
    {
      location: first_image[:location],
      image_url: first_image[:urls][:full],
      credit: {
        source: first_image[:links][:html],
        author: first_image[:user][:username]
      }
    }
  end
end
