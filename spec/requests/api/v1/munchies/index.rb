require 'rails_helper'

RSpec.describe "Munchies index" do
  get "/api/v1/munchies?location=denver,co&food=chinese"
end
