class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: session_params[:email])
    if user
      auth_user = user.authenticate(session_params[:password])
      if auth_user
        render json: SessionSerializer.new(auth_user), status: 200
      end
    end
  end

  private
    def session_params
      params.permit(:email, :password)
    end

end
