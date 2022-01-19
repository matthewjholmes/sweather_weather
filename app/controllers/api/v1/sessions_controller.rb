class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: { errors: { details: 'Incorrect email or password' } }, status: 401
    end
  end
end
