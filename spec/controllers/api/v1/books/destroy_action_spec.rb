require 'rails_helper'

describe Api::V1::BooksController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'DELETE /api/v1/books/:id' do
    let!(:book) { create(:book) }
    let!(:book_2) { create(:book) }

    context 'when is a valid request' do
      before(:each) { 
        delete "/api/v1/books/#{book.id}", headers: headers
      }

      it 'should return status 204 no content' do
        expect(response).to have_http_status(204)
      end

      it 'should delete one book' do
        expect(Book.all).to eq([book_2])
      end
    end

    context 'when the request isnt valid' do
      before { delete '/api/v1/books/not_found', headers: header }

      it 'should return 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return an error message' do
        expect(json['errors']).to_not be_empty
      end

    end
  end
end