class Api::V1::ForecastController < ApplicationController

  def index
    require "pry"; binding.pry
    location = LocationFacade.get_location(params[:location])
    weather = WeatherFacade.get_weather(location.lat, location.lon)
  end

end
