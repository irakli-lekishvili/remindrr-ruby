require 'spec_helper'

describe Remindrr::App do
  before do
    Remindrr.configure do |config|
      config.client_secret = '12345'
    end
  end

  context 'attributes' do
    describe Remindrr::App.new({
      id: 1,
      name: 'name',
      endpoint: 'http://localhost:3000',
      created_at: Time.new(1),
      updated_at: Time.new(2)
    }) do

      it { is_expected.to have_attributes(id: 1, name: 'name') }
      it { is_expected.to have_attributes(endpoint: 'http://localhost:3000') }
      it { is_expected.to have_attributes(created_at: Time.new(1)) }
      it { is_expected.to have_attributes(updated_at: Time.new(2)) }
    end
  end

  context '#all' do
    # before { @apps = Remindrr::App.all }
    before do
      stub_get("v1/apps").
        with(headers: {'Authorization': 'Token #{Remindrr.config.client_secret}'}).
      to_return(status: 200, body: "")
    end

    it do
      @apps = Remindrr::App.all
      binding.pry
    end
  end
end
