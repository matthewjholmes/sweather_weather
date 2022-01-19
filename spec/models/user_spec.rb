require 'rails_helper'

RSpec.describe User, type: :model do
  # describe 'relationships' do
  #   it { should have_many(:api_keys).dependent(:destroy) }
  # end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_uniqueness_of(:api_key) }
  end

  # describe 'instance methods' do
  #   describe '#api_key' do
  #     user = User.create!(email: 'foo@bar.com', password: 'pw', password_confirmation: 'pw')
  #     api_key_token = user.api_keys.first.token
  #
  #     it 'returns the users api key' do
  #       expect(user.api_key).to eq(api_key_token)
  #     end
  #   end
  # end
end
