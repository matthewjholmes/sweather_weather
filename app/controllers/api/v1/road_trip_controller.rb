class Api::V1::RoadTripController < ApplicationController
  # protect_from_forgery with: :null_session

  def index
    user = User.find_by(api_key: params[:api_key])
    # require "pry"; binding.pry
    if user.nil?
      render json: {errors: {details: "Valid API key is required."}}, status: 401
    else
      # require "pry"; binding.pry
      road_trip = RoadTripFacade.generate_road_trip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    end
  end
  #
  # private
  #
  # def road_trip_params
  #   params.permit(:origin, :destination)
  # end
end
