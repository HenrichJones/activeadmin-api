class Api::V1::DashboardController < ApplicationController

  def index
    @orders = Order.order_by_created_at.take(10)
    @users = User.order_by_created_at.take(10)

    render json: {
      users: @users,
      orders: @orders
    }, status: :ok
  end
end