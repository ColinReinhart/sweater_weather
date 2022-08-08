require 'rails_helper'

RSpec.describe YelpService do
  it 'gets restaurant based on categories' do
    lat = "39.6937"
    lon = "-105.0152"

    restaurant = YelpService.find_food(lat, lon)

    expect(restaurant).to be_a(Hash)
  end
end
