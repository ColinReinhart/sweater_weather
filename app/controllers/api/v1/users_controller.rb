class Api::V1::UsersController < ApplicationController

def create
  user_create = User.find_or_create_by(user_params)
  render json: UserSerializer.new(user_create), status: 201
end

private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
