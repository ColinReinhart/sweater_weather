class MunchiesSerializer
  def self.yelp_weather(weather, yelp)
  {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": yelp.city,
          "forecast": {
            "summary": weather.current_weather.conditions,
            "temperature": weather.current_weather.temperature
          },
          "restaurant": {
            "name": yelp.name,
            "address": yelp.address
          }
        }
      }
    }
  end

end
