class Api::V1::OrdersController < ApplicationController
  deserializable_resource :order, only: %i[create]

  def create
    ::Orders::CreateOrderService.define(order_params)
  end

  private

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