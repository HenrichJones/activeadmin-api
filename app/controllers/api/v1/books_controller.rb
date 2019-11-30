class Api::V1::BooksController < ApplicationController
  deserializable_resource :book, only: %i[create update]
  before_action :set_book, only: %i[update destroy]

  def index
    command = BookListFinder.call(params)

    if command.success?
      @books = command.result
      jsonapi_response(@books)
    else
      render jsonapi_errors: @books.errors.full_messages
    end
  end

  def create
    @book = Book.create(book_params)

    if @book.persisted?
      jsonapi_response(@book)
    else
      render jsonapi_errors: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      jsonapi_response(@book)
    else
      render jsonapi_errors: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    return :head, status: :no_content
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

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