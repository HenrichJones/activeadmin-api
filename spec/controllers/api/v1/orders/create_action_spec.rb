require 'rails_helper'

describe Api::V1::OrdersController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'POST /api/v1/:user_id/orders' do
    let!(:books) { create_list(:book, 3)}
    let(:order) {  create(:order, :with_books) }
    let(:order_attributes) { attributes_for(:order, { book_ids: [books.first.id, books.last.id]}) }
    let(:url) { "/api/v1/users/#{order.user.id}/orders" }
    let(:valid_attributes) {
      { data: { 
          type: 'orders',
          attributes: order_attributes 
        }
      }
    }

    let(:invalid_attributes) {
      { data: {
          type: 'orders',
          attributes: {}
        }
      }
    }

    context 'when is a valid request' do
      before { post url, params: valid_attributes.to_json, headers: header }

      it 'should return a created user' do
        expect(json['data']).to have_type('orders')
        expect(json['data']).to have_attribute("total").with_value((books.first.price + books.last.price).to_s)
        expect(json['data']).to have_attribute("state").with_value("completed")
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