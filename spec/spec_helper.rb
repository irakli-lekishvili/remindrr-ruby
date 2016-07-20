$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'
require 'vcr'
require 'remindrr'

VCR.configure do |vcr|
  vcr.cassette_library_dir = "spec/fixtures/cassettes"
  vcr.hook_into :webmock
end
