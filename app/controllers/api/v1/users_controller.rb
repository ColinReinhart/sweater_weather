class Api::V1::UsersController < ApplicationController

def create
  user_create = User.new(user_params)
  user_create[:api_key] = SecureRandom.hex
  if user_create.save
    # session[:id] = user_create[:id]
    render json: UserSerializer.new(user_create), status: 201
  else
    render json: [errors: 'invalid credentials']
  end
end

private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
