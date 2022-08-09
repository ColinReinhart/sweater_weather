require 'rails_helper'

RSpec.describe Weather do
  it "creates a weather poro", :vcr do
    lat = "39.6937"
    lon = "-105.0152"

    weather = WeatherFacade.get_weather(lat, lon)
    expect(weather.current_weather).to be_a(CurrentWeather)

    expect(weather.hourly_weather).to be_a(Array)
    expect(weather.hourly_weather.count).to eq(8)
    expect(weather.daily_weather).to be_a(Array)
    expect(weather.daily_weather.count).to eq(5)
  end
end
