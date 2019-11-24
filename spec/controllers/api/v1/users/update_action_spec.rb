require 'rails_helper'

describe Api::V1::UsersController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'PUT /api/v1/users/' do
    let(:user) { create(:user) }
    let(:url) { "/api/v1/users/#{user.id}"}
    let(:valid_attributes) {
      { data: { 
          type: 'users',
          attributes: { username: 'jones Silva' } 
        }
      }
    }
    let(:invalid_attributes) {
      { data: {
          type: 'users',
          attributes: { username: ''}
        }
      }
    }

    context 'when is a valid request' do
      before { put url, params: valid_attributes.to_json, headers: header }

      it 'should return a updated user' do
        expect(json['data']).to have_type('users')
        expect(json['data']).to have_attribute(:username).with_value('jones Silva')
      end

      it 'should return a status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request isnt valid' do
      
      context 'when parameters are invalid' do
        before { put url, params: invalid_attributes.to_json, headers: header }
        
        it 'should return 422' do
          expect(response).to have_http_status(422)
        end

        it 'should return an error message' do
          expect(json['errors']).to_not be_empty
        end

      end
    end

  end
end