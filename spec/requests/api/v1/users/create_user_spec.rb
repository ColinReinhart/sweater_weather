require 'rails_helper'

RSpec.describe "Registration request" do
  describe "happy path" do
    it "registers a new user and creates a unique AP for them" do
      expect(User.all.count).to eq(0)
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
      expect(User.all.count).to eq(1)
    end
  end

  describe "sad path" do
    it "validates consistent passwords" do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "pasword"
      }
      post '/api/v1/users', params: new_user

      expect(response.status).to eq 401
    end

    it "requires an email" do
      new_user = {
        email: "",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user

      expect(response.status).to eq 401
    end

    it "requires a password" do
      new_user = {
        email: "email@email.com",
        password: "",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user

      expect(response.status).to eq 401
    end

    it "requires a password confirmation" do
      new_user = {
        email: "email@email.com",
        password: "password",
        password_confirmation: ""
      }
      post '/api/v1/users', params: new_user

      expect(response.status).to eq 401
    end

    it "cannot register the same email twice" do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user
      post '/api/v1/users', params: new_user

      expect(response.status).to eq 401
    end
  end
end
