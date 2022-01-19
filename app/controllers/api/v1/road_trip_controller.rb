class Api::V1::RoadTripController < ApplicationController
  protect_from_forgery with: null_session

  def index
    road_trip = RoadTripFacade.generate_road_trip(road_trip_params)
    render json: RoadTripSerializer.new(road_trip)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
