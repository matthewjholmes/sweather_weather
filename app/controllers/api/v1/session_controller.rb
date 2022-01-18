class Api::V1::SessionController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      render json: user
    end
    #handle invalid email/password
  end
end
