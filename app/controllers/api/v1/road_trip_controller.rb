class Api::V1::RoadTripController < ApplicationController

  def index
    road_trip = RoadTripFacade.generate_road_trip(road_trip_params)
    render json: road_trip
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

end
