require 'spec_helper'

describe Remindrr do
  it 'has a version number' do
    expect(Remindrr::VERSION).not_to be nil
  end

  describe '#configure' do
    it 'sets correct configuration' do
      Remindrr.configure do |config|
        config.client_secret = 'client_secret'
      end

      expect(Remindrr.config.client_secret).to eql('client_secret')
    end
  end
end
