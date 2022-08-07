class WeatherFacade

def self.get_weather(lat, lon)
  weather = WeatherService.find_weather(lat,lon)
  Weather.new(weather)
end

end
