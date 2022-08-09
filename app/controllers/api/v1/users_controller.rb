class Api::V1::UsersController < ApplicationController
  before_action :check_fields

  def create
    user_create = User.new(user_params)
    user_create[:api_key] = SecureRandom.hex
    if user_create.save
      # session[:id] = user_create[:id]
      render json: UserSerializer.new(user_create), status: 201
    else
      render json: [errors: 'invalid credentials'], status: 401
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

    def check_fields
      if user_params[:email] == ""
        render json: { error: "Email Required To Register"}, status: 401
      elsif user_params[:password] == ""
        render json: { error: "Password Required To Register"}, status: 401
      elsif user_params[:password_confirmation] == ""
        render json: { error: "Password Confirmation Required To Register"}, status: 401
      elsif user_params[:password] != user_params[:password_confirmation]
        render json: { error: "Password Does Not Match Confirmation"}, status: 401
      end
  end
end
