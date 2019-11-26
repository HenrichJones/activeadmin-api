module Orders
  class CreateOrderService
  prepend SimpleCommand

    def initialize(order_params)
      @order_params = order_params
    end

    def call
      total = total_books_value(@order_params[:book_ids])
      Order.create(@order_params.merge total: total)
    end

    def total_books_value book_ids
      Book.where(id: book_ids).map(&:price).sum
    end

  end
end