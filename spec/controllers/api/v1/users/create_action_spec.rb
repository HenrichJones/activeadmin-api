require 'rails_helper'

describe Api::V1::UsersController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'POST /api/v1/users' do
    let(:user_attributes) { attributes_for(:user) }
    let(:url) { '/api/v1/users' }
    let(:valid_attributes) {
      { data: { 
          type: 'users',
          attributes: user_attributes 
        }
      }
    }

    context 'when is a valid request' do
      before { post url, params: valid_attributes.to_json, headers: header }

      it 'should return a created user' do
        expect(json['data']).to have_type('users')
        expect(json['data']).to have_attribute(:username).with_value(user_attributes[:username])
        expect(json['data']).to have_attribute(:email).with_value(user_attributes[:email])
      end

      it 'should return a status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request isnt valid' do
      
      context 'when no data has ben sent' do
        before { post url, params: {}, headers: header}

      end
    end

  end
end