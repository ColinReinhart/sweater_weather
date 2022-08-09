class Api::V1::RoadTripController < ApplicationController

  def create
    if User.find_by(api_key: road_trip_params[:api_key])
      from = road_trip_params[:origin]
      to = road_trip_params[:destination]
      directions = DirectionFacade.directions(from, to)
      start = LocationFacade.get_location(from)
      destination = LocationFacade.get_location(to)
      weather = WeatherFacade.get_weather(destination.lat, destination.lon)
      render json: RoadTripSerializer.create_road_trip(directions, start, destination, weather)
    end
  end

  private
    def road_trip_params
      params.permit(:origin, :destination, :api_key)
    end

end
