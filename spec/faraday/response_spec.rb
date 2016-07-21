require 'spec_helper'

describe Faraday::Response do
  before do
    Remindrr.configure do |config|
      config.client_secret = '12345'
    end
  end

  context 'when response code is a 401' do
    before do
      Remindrr.configure do |config|
        config.client_secret = ''
      end
    end

    it 'should raise a 401' do
      VCR.use_cassette '401' do
        expect{ Remindrr::App.all }.to raise_error(Remindrr::Unauthorized)
      end
    end
  end

  context 'when response code is a 404' do
    it 'should raise a 404' do
      VCR.use_cassette '404' do
        expect{ Remindrr::App.find(-1) }.to raise_error(Remindrr::NotFound)
      end
    end
  end

  context 'when response code is 400' do
    let(:params) {{ name: 'tars' }}

    it 'should raise a 400' do
      VCR.use_cassette '400' do
        expect{ Remindrr::App.create(params) }.to raise_error(Remindrr::BadRequest)
      end
    end

    it 'should return the body error message' do
      VCR.use_cassette '400' do
        expect do
          Remindrr::App.create(params)
          binding.pry
        end.to raise_error(Remindrr::BadRequest, /request is bad/)
      end
    end
  end
end
