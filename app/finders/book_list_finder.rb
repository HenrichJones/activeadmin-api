class BookListFinder
  prepend SimpleCommand

    def initialize(params)
      @key_values = define_parameters(params)
    end

    def call
      @result = []
      if @key_values.any?
        @key_values.each do |k_v|
          @result = define_search_type(@result, k_v)
        end
        @result.flatten
      else
        Book.all
      end
    end

    def define_search_type result, key_value
      if key_value.first.include?("scope")
        result = search_by_scope(result, key_value.last)
      else
        result = search_by_attribute(result, key_value)
      end
      result
    end

    def search_by_scope result, value
      if result.any?
        book_ids = result.flatten.map(&:id)

        case value
        when "avaiable", "all"
          result = [ Book.where(id: book_ids) ]
        when "featured"
          result = [ Book.where(id: book_ids, featured: true) ]
        end
      else
        case value
        when "avaiable", "all"
         [ Book.all ]
        when "featured"
          [ Book.where(featured: true) ]
        end
      end
    end

    def search_by_attribute result, key_value
      if result.any?
        book_ids = result.flatten.map(&:id)
        result  = [
          Book.where(
            id: book_ids
          ).where(
            "#{define_key(key_value)} ilike ?", query_type(key_value.first, key_value.last)
          )
        ]
      else
        result.push([
          Book.where(
            "#{define_key(key_value)} ilike ?", query_type(key_value.first, key_value.last)
          )
        ])
      end
      result
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