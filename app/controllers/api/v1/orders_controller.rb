class Api::V1::OrdersController < ApplicationController
  deserializable_resource :order, only: %i[create]
  before_action :set_order, only: %i[show]

  def index
    @orders = OrderListFinder.call(params[:scope])
    jsonapi_response(@orders)
  end

  def create
    command = ::Orders::CreateOrderService.call(order_params)
    jsonapi_response(command.result)
  end

  def show
    jsonapi_response(@order, :ok)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order)
      .permit(
        :state,
        :total,
        book_ids: []
      ).merge(
        user_id: params[:user_id]
      )
  end  

end