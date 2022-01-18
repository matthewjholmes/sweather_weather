class Api::V1::BackgroundsController < ApplicationController

  def index
    background_image = ImageFacade.get_background_image(params[:location])
    render json: background_image
  end

end
