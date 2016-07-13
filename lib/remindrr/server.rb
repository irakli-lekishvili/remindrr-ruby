module Remindrr
  class Server
    def self.call(env)
      new.call(env)
    end

    def call(env)
      @response.finish
    end
  end
end
