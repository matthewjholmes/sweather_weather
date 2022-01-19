class Api::V1::RoadTripController < ApplicationController
  before_action :validate_key

  def index
    road_trip = RoadTripFacade.generate_road_trip(road_trip_params)
    render json: road_trip
  end

  private

  def validate_key
    key = ApiKey.find_by(token: params[:api_key])
    # require "pry"; binding.pry
    unless key
      render json: { errors: { details: 'Valid API key is required.' } }, status: 401
    end
  end

  def road_trip_params
    params.permit(:origin, :destination)
  end

end
