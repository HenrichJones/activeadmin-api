class UserListFinder
  prepend SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      User.where('username ilike :username', username: "%#{@params[:q]}%")
    end

end