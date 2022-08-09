require 'rails_helper'

RSpec.describe "Registration request" do
  it "registers a new user and creates a unique AP for them" do
    new_user = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }
    post '/api/v1/users', params: new_user

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to be_a(Hash)
    expect(response_body).to have_key(:data)

    data = response_body[:data]

    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)

    attr = data[:attributes]

    expect(attr).to have_key(:email)
    expect(attr).to have_key(:api_key)
  end
end
