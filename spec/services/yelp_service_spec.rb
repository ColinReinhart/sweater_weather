require 'rails_helper'

RSpec.describe YelpService do
  it 'gets restaurant based on categories', :vcr do
    lat = "39.6937"
    lon = "-105.0152"
    search = "chinese"

    restaurant = YelpService.find_food(lat, lon, search)

    expect(restaurant).to be_a(Hash)
  end
end
