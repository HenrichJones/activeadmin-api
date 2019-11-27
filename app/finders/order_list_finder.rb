class OrderListFinder
  class << self

    def call scope
      if scope == "in_progress"
        Order.in_progress
      elsif scope == "completed"
        Order.completed
      else
        Order.all
      end
    end

  end
end