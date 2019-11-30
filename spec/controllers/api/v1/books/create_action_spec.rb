require 'rails_helper'

describe Api::V1::BooksController, type: :request do
  let(:header) { { 'Accept': 'application/vnd.api+json', 'Content-type': 'application/vnd.api+json' } }
  let(:json)  { JSON.parse(response.body) }

  describe 'POST /api/v1/books' do
    let!(:book) { create(:book) }
    let(:book_attributes) { attributes_for(:book) }
    let(:url) { '/api/v1/books' }
    let(:valid_attributes) {
      { data: { 
          type: 'books',
          attributes: book_attributes 
        }
      }
    }

    let(:invalid_attributes) {
      { data: {
          type: 'books',
          attributes: {}
        }
      }
    }

    context 'when is a valid request' do
      before { post url, params: valid_attributes.to_json, headers: header }

      it 'should return a created book' do
        expect(json['data']).to have_type('books')
        expect(json['data']).to have_attribute(:description).with_value(book_attributes[:description])
        expect(json['data']).to have_attribute(:author).with_value(book_attributes[:author])
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