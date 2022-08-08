class Api::V1::MunchiesController < ApplicationController

  def index
    location = LocationFacade.get_location(params[:location])
    weather = WeatherFacade.get_weather(location.lat, location.lon)
    yelp = YelpFacade.find_place(location.lat, location.lon, params[:food])
    render json: MunchiesSerializer.new(yelp), status: :created
  end

end
