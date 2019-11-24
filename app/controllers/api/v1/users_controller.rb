class Api::V1::UsersController < ApplicationController
  deserializable_resource :user, only: %i[create] 

  def index
    command = UserListFinder.call(params)

    if command.success?
      @users = command.result
      jsonapi_response(@users)
    else
      render jsonapi_errors: @users.errors.full_messages
    end
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      jsonapi_response(@user)
    else
       render jsonapi_errors: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end