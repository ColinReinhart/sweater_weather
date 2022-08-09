class RoadTripSerializer
  def self.create_road_trip(directions, start, destination, weather)
    if directions.formatted_time && directions.travel_hours < 24
      {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": start.city,
          "end_city": destination.city,
          "travel_time": directions.formatted_time,
          "weather_at_eta": {
            "temperature":  weather.hourly_long[(directions.travel_hours) - 1].temp ,
            "conditions": weather.hourly_long[(directions.travel_hours) - 1].conditions
              }
            }
          }
        }
    elsif directions.formatted_time && directions.travel_hours > 24
      {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": start.city,
          "end_city": destination.city,
          "travel_time": directions.formatted_time,
          "weather_at_eta": {
            "high_temp":  weather.daily_weather[((directions.travel_hours) /24).round ].max_temp ,
            "low_temp":  weather.daily_weather[((directions.travel_hours) /24).round ].min_temp ,
            "conditions": weather.daily_weather[((directions.travel_hours) /24).round ].conditions
              }
            }
          }
        }
    else
          {
        "data": {
          "id": nil,
          "type": "roadtrip",
          "attributes": {
            "start_city": start.city,
            "end_city": destination.city,
            "travel_time": 'Impossible'
          }
        }
      }
    end
  end
end
