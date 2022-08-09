class RoadTripSerializer
  def self.create_road_trip(directions, start, destination, weather)
    {
  "data": {
    "id": nil,
    "type": "roadtrip",
    "attributes": {
      "start_city": start.city,
      "end_city": destination.city,
      "travel_time": directions.formatted_time,
      "weather_at_eta": {
        "temperature":  weather.hourly_long[(directions.travel_hours) - 1].temp,
        "conditions": weather.hourly_long[(directions.travel_hours) - 1].conditions
      }
    }
  }
}
  end
end
