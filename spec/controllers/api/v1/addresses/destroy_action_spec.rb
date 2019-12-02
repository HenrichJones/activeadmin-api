require 'rails_helper'

describe Api::V1::AddressesController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'DELETE /api/v1/users/:id/addresses/:address_id' do
    let!(:user) { create(:user, :with_addresses) }

    context 'when is a valid request' do
      before(:each) { 
        delete "/api/v1/users/#{user.id}/addresses/#{user.addresses.first.id}", headers: headers
      }

      it 'should return status 204 no content' do
        expect(response).to have_http_status(204)
      end

      it 'should delete one user' do
        expect(user.addresses.count).to eq(2)
      end
    end

    context 'when the request isnt valid' do
      before { delete "/api/v1/users/#{user.id}/addresses/notfound", headers: header }

      it 'should return 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return an error message' do
        expect(json['errors']).to_not be_empty
      end

    end
  end
end