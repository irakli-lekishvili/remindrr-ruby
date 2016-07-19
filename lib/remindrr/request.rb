require 'faraday_middleware'
require 'faraday/raise_http_exception'

module Remindrr
  module Request
    include Connection

    def get(uri)
      connection.get(uri).body
    end

    def post(url, attributes, post=true)
      method = post ? :post : :put

      response = connection.send(method, url) do |request|
      # response = conn.post(url) do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = attributes.to_json
      end

      response.body.inject({}){ |memo,(k,v)| memo[k.to_sym] = v; memo }
    end

    alias_method :put, :post
  end
end
