class Api::V1::UsersController < ApplicationController

  def index
    command = UserListFinder.call(params)

    if command.success?
      @users = command.result
      jsonapi_response(@users)
    else
      render jsonapi_errors: @users.errors.full_messages,
                             status: :unprocessable_enity
    end
  end

end