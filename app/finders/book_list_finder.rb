class BookListFinder
  prepend SimpleCommand

    def initialize(params)
      binding.pry 
      @params = params
    end

    def call
      Book.where('title ilike :title',
        title: "%#{@params[:q]}%"
      )
    end

end