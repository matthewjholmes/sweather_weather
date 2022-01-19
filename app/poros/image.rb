class Image
  attr_reader :id, :image

  def initialize(data)
    @id    = nil
    @image = image(data)
  end

  def image(data)
    # data[:results].first[:urls][:full]
    # require "pry"; binding.pry 
    first_image = data[:results].first
    {
      location: "#{first_image[:tags][0][:title]},#{first_image[:tags][1][:title]}",
      image_url: first_image[:urls][:full],
      credit: {
        source: first_image[:links][:html],
        author: first_image[:user][:username]
      }
    }
  end
end
