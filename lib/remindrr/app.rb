module Remindrr
  class App
    extend Request

    def initialize(attrs)
      attrs.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all
      apps = get('v1/apps')
      apps.map { |app| new app }
    end

    def self.find(id)
      app = get("v1/apps/#{id}")
      new app
    end

    def self.create(opts)
      params = {
        name:     opts[:name],
        endpoint: opts[:endpoint]
      }

      app = post('v1/apps', params)
      new app
    end
  end
end
