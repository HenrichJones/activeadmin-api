require 'rails_helper'

describe Api::V1::UsersController do
  let!(:users) { create_list(:user, 3)  }
  let(:json)  { JSON.parse(response.body) }

  describe 'GET /api/v1/users' do
    before { get :index }

    context 'when given users records' do
      it 'return a list of users' do
        expect(json['data']).to be_an(Array)
        expect(json['data'].size).to eq(3)
        expect(json['data'].first).to have_type('users')
      end
    end

  end
end