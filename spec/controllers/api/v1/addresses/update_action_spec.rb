require 'rails_helper'

describe Api::V1::AddressesController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'PUT /api/v1/users/:id/addresses/:id' do
    let(:user) { create(:user, :with_addresses) }
    let(:url) { "/api/v1/users/#{user.id}/addresses/#{user.addresses.first.id}"}
    let(:valid_attributes) {
      { data: { 
          type: 'addresses',
          attributes: { street: 'Old wilton street' } 
        }
      }
    }
    let(:invalid_attributes) {
      { data: {
          type: 'addresses',
          attributes: { street: ''}
        }
      }
    }

    context 'when is a valid request' do
      before { put url, params: valid_attributes.to_json, headers: header }

      it 'should return a updated user' do
        expect(json['data']).to have_type('addresses')
        expect(json['data']).to have_attribute(:street).with_value('Old wilton street')
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