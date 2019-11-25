require 'rails_helper'

RSpec.describe Address, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'presence validations' do
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:neigborhood) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
  end

end
