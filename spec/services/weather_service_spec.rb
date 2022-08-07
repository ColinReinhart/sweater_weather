require 'rails_helper'

RSpec.describe WeatherService do
  it "gets weather based on location", :vcr do
    lat = "39.6937"
    lon = "-105.0152"

    weather = WeatherService.find_weather(lat, lon)

    expect(weather).to be_a(Hash)
  end
end
