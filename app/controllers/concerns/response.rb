module Response

  def jsonapi_response(data, status = :ok, include = [], fields = {})
    render  jsonapi: data,
            include: include,
            fields: fields,
            status: status
  end

end