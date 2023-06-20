require 'rails_helper'

RSpec.describe LocationService do
  it "can find lat lon from city and state", :vcr do
    search = "denver, co"

    location = LocationService.find_lat_lon(search)

    expect(location).to be_a(Hash)
  end
end
