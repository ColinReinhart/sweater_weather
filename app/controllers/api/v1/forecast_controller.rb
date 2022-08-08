class Api::V1::ForecastController < ApplicationController

  def index
    location = LocationFacade.get_location(params[:location])
    weather = WeatherFacade.get_weather(location.lat, location.lon)
    render json: ForecastSerializer.new(weather), status: :created
  end

end
