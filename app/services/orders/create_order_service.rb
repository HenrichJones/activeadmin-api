module Orders
  class CreateOrderService
    class << self

      def define order_params
        total = total_books_value(order_params[:book_ids])
        Order.create(order_params.merge total: total)
      end

      def total_books_value book_ids
        Book.where(id: book_ids).map(&:price).sum
      end

    end
  end
end