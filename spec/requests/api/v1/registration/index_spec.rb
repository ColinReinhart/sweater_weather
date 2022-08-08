require 'rails_helper'

RSpec.describe "Registration request" do
  it "registers a new user and creates a unique AP for them" do
    post '/api/v1/users'

    expect(response).to be_successful

  end
end
