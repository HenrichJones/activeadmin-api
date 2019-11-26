class Api::V1::AddressesController < ApplicationController
  deserializable_resource :address, only: %i[create update]
  before_action :set_address, only: %i(update show)

  def show
    jsonapi_response(@address, :ok)
  end

  def create
    @address = Address.create(address_params)

    if @address.persisted?
      jsonapi_response(@address)
    else
       render jsonapi_errors: @address.errors, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      jsonapi_response(@address)
    else
      render jsonapi_errors: @address.errors, status: :unprocessable_entity
    end
  end

  private

  def set_address
   @address = Address.find(params[:id]) 
  end

  def address_params
    params.require(:address)
      .permit(
        :street,
        :neigborhood,
        :city,
        :state,
        :zipcode
      ).merge(
        user_id: params[:user_id]
      )
  end

end