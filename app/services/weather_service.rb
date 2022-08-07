class WeatherService < BaseService

  def self.find_weather(lat, lon)
    conn = Faraday.new("http://api.openweathermap.org") do |f|
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['appid'] = ENV['weather_api']
      f.params['units'] = "imperial"
    end
    response = conn.get('/data/2.5/onecall')
    get_json(response)
  end

end
