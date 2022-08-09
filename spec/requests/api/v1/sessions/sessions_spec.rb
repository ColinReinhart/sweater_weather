require 'rails_helper'

RSpec.describe "Sessions request" do
  describe "happy path" do
    it "can log into a session" do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user
      credentials = {
        email: "whatever@example.com",
        password: "password"
      }
      post '/api/v1/sessions', params: credentials

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)

      data = body[:data]

      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      attr = data[:attributes]

      expect(attr).to have_key(:email)
      expect(attr).to have_key(:api_key)
    end
  end

  describe "sad path" do
    it "cannot sign in if user doesn't extist" do
      credentials = {
        email: "whatever@example.com",
        password: "password"
      }
      post '/api/v1/sessions', params: credentials

      expect(response.status).to eq(401)
    end

    it "cannot log in if password is incorrect" do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user
      credentials = {
        email: "whatever@example.com",
        password: "pasword"
      }
      post '/api/v1/sessions', params: credentials

      expect(response.status).to eq(401)
    end

    it "must fill in both email and password" do
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user
      credentials = {
        email: "",
        password: "password"
      }
      post '/api/v1/sessions'
      expect(response.status).to eq(401)
      new_user = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post '/api/v1/users', params: new_user
      credentials = {
        email: "whatever@example.com",
        password: ""
      }
      post '/api/v1/sessions'

      expect(response.status).to eq(401)
    end
  end
end
