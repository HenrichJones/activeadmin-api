class Api::V1::AddressesController < ApplicationController
  deserializable_resource :address, only: %i[create]

  def create
    @address = Address.create(address_params)

    if @address.persisted?
      jsonapi_response(@address)
    else
       render jsonapi_errors: @address.errors, status: :unprocessable_entity
    end
  end

  private

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