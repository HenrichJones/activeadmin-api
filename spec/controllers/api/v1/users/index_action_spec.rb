require 'rails_helper'

describe Api::V1::UsersController do
  let(:json) { JSON.parse response.body }

  describe 'GET /api/v1/users' do
    before { get :index }

    context 'when NOT given any users records' do
      it 'return empty' do
        expect(response.status).to be == 200
        expect(json).to eq []
      end
    end

  end
end