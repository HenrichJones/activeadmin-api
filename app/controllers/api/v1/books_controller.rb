class Api::V1::BooksController < ApplicationController
  deserializable_resource :book, only: %i[create]
  
  def create
    @book = Book.create(book_params)

    if @book.persisted?
      jsonapi_response(@book)
    else
       render jsonapi_errors: @book.errors, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book)
      .permit(
        :title,
        :description,
        :author,
        :price,
        :featured,
        :avaiable_on,
        :image_file_name
      )
  end

end