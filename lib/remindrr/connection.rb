module Remindrr
  module Connection
    private

    def connection
      Faraday.new(url: 'http://localhost:3000/api') do |conn|
        conn.headers['Authorization'] = 'Token 19798f7c9fd262d0f54dddee9ed12ff0'
        conn.request  :url_encoded             # form-encode POST params
        conn.response :logger                  # log requests to STDOUT
        conn.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        conn.use      Faraday::Response::ParseJson
        conn.use      FaradayMiddleware::RaiseHttpException
      end
    end
  end
end
