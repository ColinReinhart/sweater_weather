require 'rails_helper'

RSpec.describe "Forecast request" do
  it "gets forcast for location in desired output" do
    search = "denver, co"

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data]).to have_key(:attributes)

    attr = result[:data][:attributes]

    expect(attr).to have_key(:current_weather)
    expect(attr).to have_key(:hourly_weather)
    expect(attr).to have_key(:daily_weather)
  end
end
