require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { validate_uniqueness_of(:email)}
    it { validate_presence_of(:password_digest)}
    it { validate_uniqueness_of(:api_key)}
  end
end
