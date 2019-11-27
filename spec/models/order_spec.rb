require 'rails_helper'

RSpec.describe Order, type: :model do
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:books) }
    it { should have_many(:books).through(:order_books) }
  end

  describe 'presence validations' do
    it { should validate_presence_of(:total) }
    it { should validate_presence_of(:books) }
    it { should validate_presence_of(:state) }
  end
end
