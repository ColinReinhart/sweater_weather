require 'rails_helper'

RSpec.describe Location do
  it "creates a location poro", :vcr do
    search = 'denver, co'

    location = LocationFacade.get_location(search)

    expect(location.lat).to eq(39.738453)
    expect(location.lon).to eq(-104.984853)
  end
end
