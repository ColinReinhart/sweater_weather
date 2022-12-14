require 'rails_helper'

RSpec.describe YelpFacade do
  it "creates a yelp response", :vcr do
    lat = "39.6937"
    lon = "-105.0152"
    search = "chinese"

    restaurant = YelpFacade.find_place(lat, lon, search)
    expect(restaurant).to be_a(Yelp)
  end
end
