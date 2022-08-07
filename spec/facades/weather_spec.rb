require 'rails_helper'

RSpec.describe WeatherFacade do

  it "creates a weather poro" do
    lat = "39.6937"
    lon = "-105.0152"

    weather = WeatherFacade.get_weather(lat, lon)
    expect(weather).to be_a(Weather)
  end

end
