module Remindrr
  module Request
    include Connection

    def get(uri)
      connection.get(uri).body
    end

    def post(url, attributes)
      response = connection.post(url) do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = attributes.to_json
      end
      response.body.inject({}){ |memo,(k,v)| memo[k.to_sym] = v; memo }
    end

    def self.extended(base)
      base.include(InstanceMethods)
    end

    module InstanceMethods
      include Connection

      def put(url, attributes)
        response = connection.put(url) do |request|
          request.headers['Content-Type'] = 'application/json'
          request.body = attributes.to_json
        end
        response.body.inject({}){ |memo,(k,v)| memo[k.to_sym] = v; memo }
      end

      def delete(url)
        connection.delete(url)
      end
    end
  end
end
