require 'rails_helper'

RSpec.describe Yelp do
  it "creates a yelp poro" do
    lat = "39.6937"
    lon = "-105.0152"
    search = "chinese"

    place = YelpFacade.find_place(lat, lon, search)
    expect(place).to be_a(Hash)
    require "pry"; binding.pry
  end
end
