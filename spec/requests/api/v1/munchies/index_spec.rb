require 'rails_helper'

RSpec.describe "Munchies index" do
  it "gets information in format requested" do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)

    data = result[:data]

    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)

    attr = data[:attributes]

    expect(attr).to have_key(:destination_city)
    expect(attr).to have_key(:forecast)
    expect(attr).to have_key(:restaurant)

    forecast = attr[:forecast]

    expect(forecast).to have_key(:summary)
    expect(forecast).to have_key(:temperature)

    rest = attr[:restaurant]

    expect(rest).to have_key(:name)
    expect(rest).to have_key(:address)
  end
end
