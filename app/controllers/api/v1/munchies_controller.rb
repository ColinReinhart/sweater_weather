class Api::V1::MunchiesController < ApplicationController

  def index
    location = LocationFacade.get_location(params[:location])
    weather = WeatherFacade.get_weather(location.lat, location.lon)
    render json: MunchiesSerializer.new(weather), status: :created
  end

end
