module Response

  def jsonapi_response(data, status = :created, include = [], fields = {})
    render  jsonapi: data,
            include: include,
            fields: fields,
            status: status
  end

end