class Api::V1::ForecastController < ApplicationController

  def index
    if params[:location]
      weather = WeatherFacade.get_weather(params[:location])
      render json: ForecastSerializer.new(weather)
    else
      render json: { errors: "Valid location is required.", :bad_request }
    end
  end
end
