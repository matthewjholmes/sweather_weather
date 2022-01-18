class ImageFacade

  def self.get_background_image(location)
    data = UnsplashService.get_background_image(location)
    Image.new(data)
  end

end
