require 'rails_helper'

describe Api::V1::AddressesController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'GET /api/v1/users/:id/addresses/:id' do
    let(:user) { create(:user, :with_addresses) }
    let(:url) { "/api/v1/users/#{user.id}/addresses/#{user.addresses.first.id}"}


    context 'when is a valid request' do
      before { get url, headers: header }

      it 'should return the requested address' do
        expect(json['data']).to have_id(user.addresses.first.id.to_s)
      end

      it 'should return 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request isnt valid' do
      before { get "/api/v1/users/#{user.id}/addresses/notfound", headers: headers }

      it 'should return 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return an error message' do
        expect(json['errors']).to_not be_empty
      end

    end

  end
end