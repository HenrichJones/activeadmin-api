require 'rails_helper'

describe Api::V1::OrdersController do
  let!(:books) { create_list(:book, 2)}
  let!(:orders) { create_list(:order, 3, {book_ids: [books.first.id, books.last.id], total: (books.first.price + books.last.price).to_s}) }
  let(:json)  { JSON.parse(response.body) }

  describe "GET /api/v1/users/orders" do
    before { get :index }

    context 'when given order records' do
      it 'return a list of orders' do
        expect(json['data']).to be_an(Array)
        expect(json['data'].size).to eq(3)
        expect(json['data'].first).to have_type('orders')
      end
    end

  end
end