class Api::V1::UsersController < ApplicationController

  def index
    command = UserListFinder.call(params)

    if command.success?
      @users = command.result
      jsonapi_response(@users)
    end
  end

end