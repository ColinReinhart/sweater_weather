require 'rails_helper'

RSpec.describe "Munchies index" do
  it "gets information in format requested" do
    get "/api/v1/munchies?location=denver,co&food=chinese"

    expect(response).to be_successful
  
  end
end
