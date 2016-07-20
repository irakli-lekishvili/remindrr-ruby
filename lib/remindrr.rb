require 'pry-byebug'
require 'faraday'

require 'remindrr/version'
require 'remindrr/configuration'
require 'remindrr/error'
require 'remindrr/connection'
require 'remindrr/request'
require 'remindrr/server'
require 'remindrr/app'
require 'remindrr/reminder'

module Remindrr
  def self.configure
    yield config
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.config=(config)
    @config = config
  end

  configure do |config|
    config.client_secret = ENV['CLIENT_SECRET']
  end
end
