require 'rails_helper'

RSpec.describe Weather do
  it "creates a weather poro", :vcr do
    lat = "39.6937"
    lon = "-105.0152"

    weather = WeatherFacade.get_weather(lat, lon)
    expect(weather.date).to be_a(String)
    expect(weather.sunrise).to be_a(String)
    expect(weather.sunset).to be_a(String)
  end
end
