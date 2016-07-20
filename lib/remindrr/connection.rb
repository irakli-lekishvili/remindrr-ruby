require 'faraday_middleware'
require 'faraday/raise_http_exception'

module Remindrr
  module Connection
    private

    def connection
      Faraday.new(url: 'http://localhost:3000/api') do |conn|
        conn.headers['Authorization'] = "Token #{Remindrr.config.client_secret}"
        conn.request  :url_encoded             # form-encode POST params
        conn.response :logger                  # log requests to STDOUT
        conn.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        conn.use      Faraday::Response::ParseJson
        conn.use      FaradayMiddleware::RaiseHttpException
      end
    end
  end
end
