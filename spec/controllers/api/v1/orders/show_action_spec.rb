require 'rails_helper'

describe Api::V1::OrdersController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'GET /api/v1/orders/:id' do
    let!(:order) { create(:order, :with_books) }
    let(:url) { "/api/v1/orders/#{order.id}" }

    context 'when is a valid request' do
      before { get url, headers: header }

      it 'should return 200' do
        expect(response).to have_http_status(200)
      end

      it 'should return the requested user' do
        expect(json['data']).to have_id(order.id.to_s)
      end
    end

    context 'when is an invalid request' do
      before { get '/api/v1/orders/not_found', headers: header }

      it 'should return 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return an error message' do
        expect(json['errors']).to_not be_empty
      end
    end
  end
end