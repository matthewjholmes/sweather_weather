class Api::V1::BackgroundsController < ApplicationController
  def index
    background_image = ImageFacade.get_background_image(params[:location])
    require "pry"; binding.pry
    render json: BackgroundSerializer.new(background_image)
  end
end
