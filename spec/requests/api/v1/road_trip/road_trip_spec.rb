require 'rails_helper'

RSpec.describe "Roadtrip request" do
  describe "happy path" do
    it "can fidn the weather of a location at time of arrival", :vcr do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user

      body = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "#{User.first[:api_key]}"
      }
      post '/api/v1/road_trip', params: body

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:data)
      data = response_body[:data]

      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)
      attr = data[:attributes]

      expect(attr).to have_key(:start_city)
      expect(attr).to have_key(:end_city)
      expect(attr).to have_key(:weather_at_eta)
      expect(attr).to have_key(:travel_time)

      waeta = attr[:weather_at_eta]

      expect(waeta).to have_key(:temperature)
      expect(waeta).to have_key(:conditions)
    end

    it "can fine weather days away", :vcr do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user

      body = {
        "origin": "Denver,CO",
        "destination": "Panama City, Panama",
        "api_key": "#{User.first[:api_key]}"
      }
      post '/api/v1/road_trip', params: body

      expect(response).to be_successful
    end
  end

  describe "sad path" do
    it "will not return weather is route is impossible", :vcr do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user

      body = {
        "origin": "Denver,CO",
        "destination": "London, UK",
        "api_key": "#{User.first[:api_key]}"
      }
      post '/api/v1/road_trip', params: body

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:data)
      data = response_body[:data]

      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)
      attr = data[:attributes]

      expect(attr).to have_key(:start_city)
      expect(attr).to have_key(:end_city)
      expect(attr).to have_key(:travel_time)
      expect(attr[:travel_time]).to eq('Impossible')
      expect(attr).to_not have_key(:weather_at_eta)
    end

    it "cannot plan a trip without an API" do
      body = {
        "origin": "Denver,CO",
        "destination": "London, UK",
        "api_key": "Hacker API Key"
      }

      post '/api/v1/road_trip', params: body

      expect(response.status).to eq(401)
    end
  end
end
