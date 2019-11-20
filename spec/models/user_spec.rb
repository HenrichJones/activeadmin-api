require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should belong_to(:address).class_name('Address') }
  end

  describe 'presence validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
  end
 
end
