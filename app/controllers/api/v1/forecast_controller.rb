class Api::V1::ForecastController < ApplicationController

  def index
    weather = WeatherFacade.get_weather(params[:location])
    render json: weather
  end

  private

  # def valid_location?
  #   unless validate_location(params[:location]), render json: valid_location.errors
  # end
  # This entire controller may need to be renamed to ForecastController or similar.
  # Need to handle errors; can we do this in the ApplicationController?
end
