require 'rails_helper'

RSpec.describe "Forecast request" do
  it "gets forcast for location in desired output" do
    search = "denver, co"

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data]).to have_key(:attributes)

    attr = result[:data][:attributes]

    expect(attr).to have_key(:id)
    expect(attr).to have_key(:type)
    expect(attr).to have_key(:sunrise)
    expect(attr).to have_key(:sunset)
    expect(attr).to have_key(:temperature)
    expect(attr).to have_key(:feels_like)
    expect(attr).to have_key(:humidity)
    expect(attr).to have_key(:uvi)
    expect(attr).to have_key(:visibility)
    expect(attr).to have_key(:conditions)
    expect(attr).to have_key(:icon)
    expect(attr).to have_key(:hourly_weather)
    expect(attr).to have_key(:daily_weather)
  end
end
