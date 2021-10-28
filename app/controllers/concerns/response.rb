# frozen_string_literal: true

# class of json response
module Response
  def json_response(object, status = :ok)
    render json: { data: object }, status: status
  end

  def json_response_page(object, data, opts = {}, status = :ok)
    pagination = pagination_setup(data)
    response_hash = { data: object }.merge(opts).merge(pagination: pagination).merge(status: status)
    render json: response_hash
  end

  def response_pagination(data, data_pagination, message)
    pagination = pagination_setup(data_pagination)
    response_hash = { code: 200, status: :success, message: message, data: data }.merge(pagination: pagination)
    render json: response_hash, status: 200
  end

  def response_success(message, data = nil, code = 200)
    render json: { code: code, status: 'success', message: message, data: data }, status: code
  end

  def response_each_serializer(message, data = nil, serializer = nil)
    render json: {
      code: '200',
      status: 'success',
      message: message,
      data: ActiveModel::SerializableResource.new(data, each_serializer: serializer)
    }, status: 200
  end

  def response_error(message, data = nil, code = 400)
    render json: { code: code, status: 'error', message: message, error: data }, status: code
  end

  def response_auth_failed
    render json: { code: '403', status: 'forbidden', message: 'invalid access token' }, status: 403
  end

  private

  def pagination_setup(data)
    { 'current_page': data.current_page,
      'total_pages': data.total_pages,
      'next_page': data.next_page,
      'prev_page': data.prev_page,
      'first_page': data.first_page?,
      'last_page': data.last_page? }
  end
end
