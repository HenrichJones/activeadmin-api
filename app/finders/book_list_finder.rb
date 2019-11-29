class BookListFinder
  prepend SimpleCommand

    def initialize(params)
      @key_values = define_parameters(params)
    end

    def call
      @result = []
      if @key_values.any?
        @key_values.each do |k_v|
          if @result.any?
            book_ids = @result.flatten.map(&:id)
            @result  = [
              Book.where(
                id: book_ids
              ).where(
                "#{define_key(k_v)} ilike ?", query_type(k_v.first, k_v.last)
              )
            ]
          else
            @result.push([
              Book.where(
                "#{define_key(k_v)} ilike ?", query_type(k_v.first, k_v.last)
              )
            ])
          end
        end
        @result.flatten
      else
        Book.all
      end
    end

    def define_parameters params
      key_value = []
      keys = params.except(:controller, :action).keys
      keys.each do |k|
        key_value.push([k, params[:"#{k}"]] )
      end
      key_value
    end

    def define_key key_value
      return "avaiable_on" if key_value.first.include?('avaiable')
      key_value.first.split('_').first
    end

    def query_type(query, search_value)
      case
      when query.include?("equals")
        "#{search_value}"
      when query.include?("contains")
        "%#{search_value}%"
      when query.include?("starts_with")
        "#{search_value}%"
      when query.include?("ends_with")
        "%#{search_value}"
      else
        ""
      end
    end

end