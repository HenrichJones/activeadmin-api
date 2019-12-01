module Response

  def jsonapi_response(data, status = :created, include = [], fields = {})
binding.pry
    render  jsonapi: data,
            include: include,
            fields: fields,
            status: status
  end

end