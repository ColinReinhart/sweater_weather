require 'rails_helper'

RSpec.describe "Munchies index" do
  xit "gets information in format requested" do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data]).to have_key(:id)
    expect(result[:data]).to have_key(:type)
    expect(result[:data]).to have_key(:attributes)


  end
end
