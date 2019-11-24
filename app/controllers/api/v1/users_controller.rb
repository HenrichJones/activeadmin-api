class Api::V1::UsersController < ApplicationController
  deserializable_resource :user, only: %i[create update]
  before_action :set_user, only: %i(show update)

  def index
    command = UserListFinder.call(params)

    if command.success?
      @users = command.result
      jsonapi_response(@users)
    else
      render jsonapi_errors: @users.errors.full_messages
    end
  end

  def show
    jsonapi_response(@user, :ok)
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?
      jsonapi_response(@user)
    else
       render jsonapi_errors: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      jsonapi_response(@user)
    else
      render jsonapi_errors: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end