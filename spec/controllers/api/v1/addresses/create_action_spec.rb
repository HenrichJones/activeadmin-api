require 'rails_helper'

describe Api::V1::AddressesController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'POST /api/v1/:user_id/addresses' do
    let!(:user) { create(:user) }
    let(:address) { create(:address) }
    let(:address_attributes) { attributes_for(:address) }
    let(:url) { "/api/v1/users/#{user.id}/addresses" }
    let(:valid_attributes) {
      { data: { 
          type: 'address',
          attributes: address_attributes 
        }
      }
    }

    let(:invalid_attributes) {
      { data: {
          type: 'users',
          attributes: {}
        }
      }
    }

    context 'when is a valid request' do
      before { post url, params: valid_attributes.to_json, headers: header }

      it 'should return a created user' do
        expect(json['data']).to have_type('addresses')
        expect(json['data']).to have_attribute(:street).with_value(address_attributes[:street])
        expect(json['data']).to have_attribute(:zipcode).with_value(address_attributes[:zipcode])
      end

      it 'should return a status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request isnt valid' do
      
      context 'when parameters are invalid' do
        before { post url, params: invalid_attributes.to_json, headers: header }
        
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