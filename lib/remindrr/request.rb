require 'faraday_middleware'
require 'faraday/raise_http_exception'

module Remindrr
  module Request
    def get(uri)
      conn.get(uri).body
    end

    def post(url, attributes)
      response = conn.post(url) do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = attributes.to_json
      end

      response.body.inject({}){ |memo,(k,v)| memo[k.to_sym] = v; memo }
    end

    private

    def conn
      Faraday.new(url: 'http://localhost:3000/api') do |connection|
        connection.headers['Authorization'] = 'Token 19798f7c9fd262d0f54dddee9ed12ff0'
        connection.request  :url_encoded             # form-encode POST params
        connection.response :logger                  # log requests to STDOUT
        connection.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        connection.use      Faraday::Response::ParseJson
        connection.use      FaradayMiddleware::RaiseHttpException
      end
    end
  end
end
