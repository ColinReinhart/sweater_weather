require 'rails_helper'

RSpec.describe "Forecast request" do
  it "gets forcast for location in desired output" do
    search = "denver, co"

    get "/api/v1/forecast=#{search}"
    require "pry"; binding.pry

    expect(response).to be successful

    result = JSON.parse(response.body, symobolize_names: true)

  end
end
