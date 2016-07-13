require 'json'

module Remindrr
  class Server
    def self.call(env)
      new.call(env)
    end

    def call(env)
      @request  = Rack::Request.new(env)
      @response = Rack::Response.new

      if @request.post?
        receive
      end

      @response.finish
    end

    def receive
      body = @request.body.read
      body = parse_request(body)
      Reminder.receive(body)

    rescue Remindrr::BadRequest => error
      respond_with_error(error)
    end

    def parse_request(body)
      JSON.parse(body)
    rescue JSON::ParserError
      raise Remindrr::BadRequest, 'Error parsing request body format'
    end

    def respond_with_error(error)
      @response.status = 400
      @response.write(error.message)
      @response.headers['Content-Type'.freeze] = 'text/plain'.freeze
    end
  end
end
